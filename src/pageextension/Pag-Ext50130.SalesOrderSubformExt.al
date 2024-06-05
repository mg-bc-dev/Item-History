/// <summary>
/// PageExtension SalesOrderExt (ID 50130) extends Record Sales Order.
/// </summary>
pageextension 50130 SalesOrderSubformExt extends "Sales Order Subform"
{
    actions
    {
        // Add changes to page actions here
        addafter("&Line")
        {
            action("Item History")
            {
                ApplicationArea = All;
                Caption = 'Item History';
                // Promoted = true;
                // PromotedCategory = Process;
                Image = History;
                RunObject = page "Customer Item History";
                RunPageLink = "Item No." = field("No.");
            }
            action("Item History 1")
            {
                ApplicationArea = All;
                Caption = 'Item History 1';
                // Promoted = true;
                // PromotedCategory = Process;
                Image = History;
                RunObject = page "Item History";
                RunPageLink = "Item No." = field("No.");
                trigger OnAction()
                var
                    codeunit: Codeunit codeunit;
                begin
                    codeunit.ItemHistoryProcedure(Rec."No.");
                end;
            }
        }
    }
}