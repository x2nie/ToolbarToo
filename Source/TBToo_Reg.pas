unit TBToo_Reg;

interface

uses
  SysUtils, Classes,
  TBToo, ToolbarToo;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('ToolbarToo', [TDockToo]);
  RegisterComponents('ToolbarToo', [TToolbarToo]);
end;

end.
