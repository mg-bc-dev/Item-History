pageextension 50132 ItemListExt extends "Item List"
{
    layout
    {
        modify(InventoryField)
        {
            trigger OnDrillDown()
            var
                myInt: Integer;
            begin
                // Message('You Can''t drill Down.');
                Error('');
            end;
        }
    }
}
