/// <summary>
/// Table Customer Item History (ID 50130).
/// </summary>
table 50131 "Item History"
{
    DataClassification = CustomerContent;

    fields
    {
        field(50130; "Line No."; Integer)
        {
            DataClassification = CustomerContent;
        }
        field(50131; "Customer No."; Code[20])
        {
            DataClassification = CustomerContent;
        }
        field(50132; "Customer Name"; Text[100])
        {
            DataClassification = CustomerContent;
        }
        field(50133; "Sales Date"; Date)
        {
            DataClassification = CustomerContent;
        }
        field(50134; "Sold Qty."; Decimal)
        {
            DecimalPlaces = 0 : 2;
            DataClassification = CustomerContent;
        }
        field(50135; "Unit Price"; Decimal)
        {
            AutoFormatType = 2;
            DataClassification = CustomerContent;
        }
        field(50136; "Sold Amount"; Decimal)
        {
            AutoFormatType = 2;
            DataClassification = CustomerContent;
        }
        field(50137; "Profit %"; Decimal)
        {
            DecimalPlaces = 0 : 2;
            DataClassification = CustomerContent;
        }
        field(50138; "Item No."; Code[20])
        {
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(Key1; "Line No.")
        {
            Clustered = true;
        }
    }
}