/// <summary>
/// Codeunit codeunit (ID 50130).
/// </summary>
codeunit 50130 "codeunit"
{
    trigger OnRun()
    begin
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", 'OnAfterPostSalesLine', '', true, true)]
    local procedure OnAfterPostSalesLine(var SalesHeader: Record "Sales Header"; var SalesLine: Record "Sales Line")
    var
        CustItemHist: Record "Customer Item History";
        LineNo: Integer;
        Item: Record Item;
    begin
        Item.Reset();
        CustItemHist.Reset();
        if CustItemHist.FindLast() then
            LineNo := CustItemHist."Line No.";
        CustItemHist.Init();
        CustItemHist."Line No." := LineNo + 1;
        CustItemHist."Customer No." := SalesHeader."Sell-to Customer No.";
        CustItemHist."Customer Name" := SalesHeader."Sell-to Customer Name";
        CustItemHist."Sales Date" := SalesHeader."Posting Date";
        CustItemHist."Item No." := SalesLine."No.";
        CustItemHist."Sold Qty." := SalesLine.Quantity;
        CustItemHist."Unit Price" := SalesLine."Unit Cost";
        CustItemHist."Sold Amount" := SalesLine."Unit Price";
        Item.SetRange("No.", SalesLine."No.");
        If Item.FindFirst() then
            CustItemHist."Profit %" := Item."Profit %";
        CustItemHist.Insert();
    end;



    /// <summary>
    /// ItemHistoryProcedure.
    /// <param name="ItemNo">Code[20].</param>
    /// </summary>
    procedure ItemHistoryProcedure(ItemNo: Code[20])
    var
        SalesInvLn: Record "Sales Invoice Line";
        SalesInvHdr: Record "Sales Invoice Header";
        Item: Record Item;
        ItemHist: Record "Item History";
        LineNo: Integer;
    begin
        ItemHist.DeleteAll();
        SalesInvLn.Reset();
        SalesInvLn.SetRange("No.", ItemNo);
        If SalesInvLn.FindSet() then
            repeat
                ItemHist.Reset();
                If ItemHist.FindLast() then begin
                    if ItemHist."Line No." <> 0 then
                        LineNo := ItemHist."Line No."
                    else
                        LineNo := 1;
                end;
                SalesInvHdr.Reset();
                SalesInvHdr.SetRange("No.", SalesInvLn."Document No.");
                if SalesInvHdr.FindFirst() then begin
                    ItemHist.Init();
                    ItemHist."Line No." := LineNo + 1;
                    ItemHist."Customer No." := SalesInvHdr."Sell-to Customer No.";
                    ItemHist."Customer Name" := SalesInvHdr."Sell-to Customer Name";
                    ItemHist."Sales Date" := SalesInvHdr."Posting Date";
                    ItemHist."Sold Qty." := SalesInvLn.Quantity;
                    ItemHist."Unit Price" := SalesInvLn."Unit Cost";
                    ItemHist."Sold Amount" := SalesInvLn.Amount;
                    ItemHist."Item No." := SalesInvLn."No.";
                    Item.SetRange("No.", SalesInvLn."No.");
                    If Item.FindFirst() then
                        ItemHist."Profit %" := ItemHist."Sold Amount" - (ItemHist."Unit Price" * ItemHist."Sold Qty.");
                    ItemHist.Insert();
                end;
            until SalesInvLn.Next() = 0;
    end;
}
