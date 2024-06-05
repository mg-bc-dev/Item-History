/// <summary>
/// Page Customer Item History (ID 50130).
/// </summary>
page 50130 "Customer Item History"
{
    ApplicationArea = All;
    Caption = 'Customer Item History';
    PageType = List;
    SourceTable = "Customer Item History";
    UsageCategory = Lists;
    Editable = false;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Customer No."; Rec."Customer No.")
                {
                    Caption = 'Customer No.';
                }
                field("Customer Name"; Rec."Customer Name")
                {
                    Caption = 'Customer Name';
                }
                field("Due Date"; Rec."Sales Date")
                {
                    Caption = 'Sales Date';
                }
                field("Sold Qty."; Rec."Sold Qty.")
                {
                    ToolTip = 'Specifies the value of the Sold Qty. field.', Comment = '%';
                }
                field("Unit Price"; Rec."Unit Price")
                {
                    ToolTip = 'Specifies the value of the Unit Price field.', Comment = '%';
                }
                field("Sold Amount"; Rec."Sold Amount")
                {
                    ToolTip = 'Specifies the value of the Sold Amount field.', Comment = '%';
                }
                field("Profit %"; Rec."Profit %")
                {
                    ToolTip = 'Specifies the value of the Profit % field.', Comment = '%';
                }
            }
        }
    }
}
