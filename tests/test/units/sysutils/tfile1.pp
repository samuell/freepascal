PROGRAM Test;

USES
  SysUtils;

procedure do_error(l : longint);
  begin
     writeln('Error near number ',l);
     halt(1);
  end;

VAR
  dateTime: TDateTime;
  f : file;

BEGIN
  if FileExists('datetest.dat') then
    begin
      Assign(f,'datetest.dat');
      Erase(f);
    end;

  if FileExists('datetest.dat') then
    do_error(1000);

  FileClose(FileCreate('datetest.dat'));

  if not(FileExists('datetest.dat')) then
    do_error(1001);

  dateTime := IncMonth(Now, -1);
  if FileSetDate('datetest.dat', DateTimeToFileDate(dateTime))<>0 then
    do_error(1002);

  if FileExists('datetest.dat') then
    begin
      Assign(f,'datetest.dat');
      Erase(f);
    end;
END.
