/// <summary>
/// PageExtension CustomerListExt (ID 50131) extends Record Customer List.
/// </summary>
pageextension 50131 CustomerListExt extends "Customer List"
{
    actions
    {
        addafter(Email)
        {
            action(ReverseSelectedCustomerName)
            {
                Caption = 'Reverse Customer Name';
                Image = ReverseRegister;
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                trigger OnAction()
                var
                    StringList: List of [Text];
                    StringLetter: Text;
                    ReversedString: Text;
                begin
                    ReversedString := '';
                    foreach StringLetter in Rec.Name do
                        StringList.Add(StringLetter);
                    StringList.Reverse();
                    foreach StringLetter in StringList do
                        ReversedString += StringLetter;
                    Message(ReversedString);
                end;
            }
            action(ReverseSelectedCustomerName1)
            {
                Caption = 'Reverse Customer Name1';
                Image = ReverseRegister;
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                trigger OnAction()
                var
                    I, J : Integer;
                    ReversedString: Text;
                begin
                    ReversedString := '';
                    J := 0;
                    for I := StrLen(Rec.Name) downto 1 do begin
                        J += 1;
                        ReversedString[J] := Rec.Name[I];
                    end;
                    Message(ReversedString);
                end;
            }
            action(ReverseSelectedCustomerName2)
            {
                Caption = 'Reverse Customer Name2';
                Image = ReverseRegister;
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                trigger OnAction()
                var
                    I: Integer;
                    ReversedString: Text;
                begin
                    ReversedString := '';
                    for I := StrLen(Rec.Name) downto 1 do begin
                        ReversedString += CopyStr(Rec.Name, I, 1);
                    end;
                    Message(ReversedString);
                end;
            }
        }
    }
}