unit main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.StdCtrls, Vcl.ExtCtrls,
  Data.Win.ADODB, Vcl.ComCtrls, Data.DB;

type

    Tfrm = class(TForm)
    pc: TPageControl;
    p1: TTabSheet;
    gs: TStringGrid;
    RollBack: TButton;
    DelRec: TButton;
    AddRec: TButton;
    Label1: TLabel;
    p2: TTabSheet;
    p_xml2tab: TTabSheet;
    Label3: TLabel;
    b_xml2tab_exec: TButton;
    b_xml2tab_takedir: TButton;
    OpenDialog1: TOpenDialog;
    gt_xml2tab1: TStringGrid;
    labeldir: TLabel;
    CloseAll: TButton;
    Label2: TLabel;
    gt: TStringGrid;
    Label4: TLabel;
    gso: TStringGrid;
    AddRecOra: TButton;
    DelRecOra: TButton;
    RollBackOra: TButton;
    SaveCng: TButton;
    SaveCngOra: TButton;
    procedure FormActivate(Sender: TObject);
    procedure AddRecClick(Sender: TObject);
    procedure DelRecClick(Sender: TObject);
    procedure SaveCngClick(Sender: TObject);
    procedure gsSetEditText(Sender: TObject; ACol, ARow: Integer;
    const Value: string);
    procedure RollBackClick(Sender: TObject);
    procedure pcDrawTab(Control: TCustomTabControl; TabIndex: Integer;
    const Rect: TRect; Active: Boolean);
    procedure b_xml2tab_takedirClick(Sender: TObject);
    procedure b_xml2tab_execClick(Sender: TObject);
    procedure CloseAllClick(Sender: TObject);
    procedure AddRecOraClick(Sender: TObject);
    procedure DelRecOraClick(Sender: TObject);
    procedure RollBackOraClick(Sender: TObject);
    procedure SaveCngOraClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

  Const CON_STR   = 'Provider=MSOLEDBSQL.1;Integrated Security=SSPI;Persist Security Info=False;User ID="";Initial Catalog=sqlmes;Data Source=WIN-VU629SPOBTT;Initial File Name="";Server SPN="";Authentication="";Access Token=""';
  //Const CON_STRO  = 'Provider=OraOLEDB.Oracle.1;Password=Radius12345;Persist Security Info=True;User ID=C##Radmin;Data Source=orcl';
  Const CON_STRO  = 'Provider=OraOLEDB.Oracle.1;Password=Radius12345;Persist Security Info=True;User ID=C##Radmin;Data Source=OraHome';
  Const SOURCE    = 'sqlmes.agk_udv.U_POSTAVKI';
  Const SOURCEO   = 'U_POSTAVKI';
  Const TARGET    = 'sqlmes.agk_mes.U_POSTAVKI';


  Function RefreshGridSource() : integer;
  Function RefreshGridSourceOra() : integer;
  function ApplyCngToTarget() : integer;
  Function RefreshGridTarget() : integer;
  Function RefreshGridTargetFolderXML() : integer;
  Function Button(mode : String) : integer;
  Function TranDate(date : String) : String;
  Function TrimStr(str : String) : String;
  function SaveText(text : String) : integer;


var

  frm    : Tfrm;
  query  : TADOQuery;
  queryo : TADOQuery;
  cmd    : TADOCommand;
  nCol : integer;

  cngArr : array of String;
  cngLen : integer;

  delArr : array of String;
  delLen : integer;

  insLen : integer;

  cngArrOra : array of String;
  cngLenOra : integer;

  delArrOra : array of String;
  delLenOra : integer;

  insLenOra : integer;

  sourceFolder : String;

  sourceTableSql : String;
  sourceTableOra : String;

implementation

{$R *.dfm}


procedure Tfrm.FormActivate(Sender: TObject);
var
  w0, w1, w2, w3, w4, add, rcnt, ccnt : integer;
begin

  w0 := 36;
  w1 := 68;
  w2 := 470;
  w3 := 42;
  w4 := 52;
  add := 26;

  rcnt := 1;
  ccnt := 5;

  gs.Top := 45;
  gs.Left := 25;
  gs.Width := w0+w1+w2+w3+w4+add;

  gt.Left := 25;
  gt.Width := w0+w1+w2+w3+w4+add;

  gt_xml2tab1.Top := 45;
  gt_xml2tab1.Left := 25;
  gt_xml2tab1.Width := w0+w1+w2+w3+w4+add;

  gs.ColWidths[0] := w0;
  gs.Cells[0,0] := 'ID';
  gs.ColWidths[1] := w1;
  gs.Cells[1,0] := '����';
  gs.ColWidths[2] := w2;
  gs.Cells[2,0] := '������������ �����';
  gs.ColWidths[3] := w3;
  gs.Cells[3,0] := '�����';
  gs.ColWidths[4] := w4;
  gs.Cells[4,0] := '�������';
  gs.RowCount := rcnt;
  gs.ColCount := ccnt;

  gso.ColWidths[0] := w0;
  gso.Cells[0,0] := 'ID';
  gso.ColWidths[1] := w1;
  gso.Cells[1,0] := '����';
  gso.ColWidths[2] := w2;
  gso.Cells[2,0] := '������������ �����';
  gso.ColWidths[3] := w3;
  gso.Cells[3,0] := '�����';
  gso.ColWidths[4] := w4;
  gso.Cells[4,0] := '�������';
  gso.RowCount := rcnt;
  gso.ColCount := ccnt;

  gt.ColWidths[0] := w0;
  gt.Cells[0,0] := 'ID';
  gt.ColWidths[1] := w1;
  gt.Cells[1,0] := '����';
  gt.ColWidths[2] := w2;
  gt.Cells[2,0] := '������������ �����';
  gt.ColWidths[3] := w3;
  gt.Cells[3,0] := '�����';
  gt.ColWidths[4] := w4;
  gt.Cells[4,0] := '�������';
  gt.RowCount := rcnt;
  gt.ColCount := ccnt;

  gt_xml2tab1.ColWidths[0] := w0;
  gt_xml2tab1.Cells[0,0] := 'ID';
  gt_xml2tab1.ColWidths[1] := w1;
  gt_xml2tab1.Cells[1,0] := '����';
  gt_xml2tab1.ColWidths[2] := w2;
  gt_xml2tab1.Cells[2,0] := '������������ �����';
  gt_xml2tab1.ColWidths[3] := w3;
  gt_xml2tab1.Cells[3,0] := '�����';
  gt_xml2tab1.ColWidths[4] := w4;
  gt_xml2tab1.Cells[4,0] := '�������';
  gt_xml2tab1.RowCount := rcnt;
  gt_xml2tab1.ColCount := ccnt;

  //gt.Options := gt.Options + [goEditing];

  sourceTableSql := 'agk_udv.u_postavki_sql';

  query := TADOQuery.Create(nil);
  query.ConnectionString := CON_STR;

  queryo := TADOQuery.Create(nil);
  queryo.ConnectionString := CON_STRO;

  cmd := TADOCommand.Create(nil);
  cmd.ConnectionString := CON_STRO;

  cngLen := 0;
  delLen := 0;
  insLen := 0;

  cngLenOra := 0;
  delLenOra := 0;
  insLenOra := 0;

  nCol := 5;

  RefreshGridSource();
  RefreshGridSourceOra();
  RefreshGridTarget();
  RefreshGridTargetFolderXML();

end;  // Tfrm.FormActivate(Sender: TObject)

procedure Tfrm.AddRecClick(Sender: TObject);
var
  nLine : integer;
begin
  nLine := frm.gs.RowCount + 1;
  frm.gs.RowCount := nLine;
  insLen := insLen + 1;
  frm.RollBack.Enabled := true;
  frm.SaveCng.Enabled  := true;
end;

procedure Tfrm.AddRecOraClick(Sender: TObject);
var
  nLine : integer;
begin
  nLine := frm.gso.RowCount + 1;
  frm.gso.RowCount := nLine;
  insLenOra := insLenOra + 1;
  frm.RollBack.Enabled := true;
  frm.SaveCng.Enabled  := true;
end;

procedure Tfrm.b_xml2tab_execClick(Sender: TObject);
var
  str : String;
begin
  //ShowMessage('� ������');

  try
    query.Open;
  except
    ShowMessage('������ ���������� � ����� ������. ���������� ��� ���');
    query.Close;
    exit;
  end;

    b_xml2tab_exec.Enabled := false;
    b_xml2tab_takedir.Enabled := false;
    CloseAll.Enabled := false;
    //sourceFolder := 'C:\Users\ailina\Documents\Visual Studio 2012\projects\SSIS_Rusal\Data';
    query.Close;
    query.SQL.Clear;
    query.SQL.Add('use [sqlmes] ');
    query.ExecSQL;
    query.SQL.Clear;

    str := 'DECLARE '#13#10
    + '@return_value int,'#13#10
    + '@sourcefolder nvarchar (200);'#13#10
    + 'set @sourcefolder = ''' + sourceFolder + ''';'#13#10
    + 'EXEC	@return_value = [dbo].[ssis_rusalka_transfer_xml] @sourcefolder;'#13#10
    + 'SELECT	''Return Value'' = @return_value'#13#10;
    //ShowMessage(str);

    query.SQL.Text := str;
    query.ExecSQL;
    query.Close;
    b_xml2tab_exec.Enabled := true;
    b_xml2tab_takedir.Enabled := true;
    CloseAll.Enabled := true;
    RefreshGridTargetFolderXML();
    ShowMessage('�������� ��������� �������');

end;  // Tfrm.b_xml2tab_execClick(Sender: TObject)

procedure Tfrm.CloseAllClick(Sender: TObject);
begin
   if MessageDlg('�� ������������� ������ ��������� ������?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
   begin
      frm.Close;
   end;
end;

procedure Tfrm.b_xml2tab_takedirClick(Sender: TObject);
begin
  //ShowMessage('� ������');
  //OpenDialog1.Title := '��� ������ ���� ����� �������� ����� ���� xml';
  OpenDialog1.Filter := '����� � ������� xml (*.xml)|*.xml';
  OpenDialog1.InitialDir := 'c:\SSIS\Rusalka\XML\';
  OpenDialog1.FileName := '';
  OpenDialog1.Execute();
  sourceFolder := OpenDialog1.FileName;
  sourceFolder := ExtractFileDir(sourceFolder);
  //ShowMessage(sourceFolder);
  if sourceFolder = ''
  then
    begin
      b_xml2tab_exec.Enabled := false;
      ShowMessage('������� �� ������. ���������� ��� ���');
    end
  else
    begin
      frm.labeldir.Caption := '��� �������� ������ XML ������ ������� ' + sourceFolder;
      frm.labeldir.Caption := '��� �������� ������ �� ������ XML ������ �������: "' + sourceFolder + '"';
      b_xml2tab_exec.Enabled := true;
    end;
end;

procedure Tfrm.DelRecClick(Sender: TObject);
var
  row    : integer;
  nLine  : integer;
  col, i : Integer;
begin
  nLine := frm.gs.RowCount;
  nCol  := frm.gs.ColCount;
  row   := frm.gs.Row;

  if frm.gs.RowCount = 1 then exit;
  if frm.gs.Row = 0 then exit;

  delLen := delLen + 1;
  setlength(delArr,delLen);
  delArr[delLen-1] := frm.gs.Cells[0,row];

  if nLine = 2 then
  begin
    frm.gs.Rows[1].Clear;
    nLine := 1;
    frm.gs.RowCount := 1;
    exit;
  end;

  for i := row to nLine-2 do
    for col := 0 to nCol-1 do
    begin
      frm.gs.Cells[col,i] := frm.gs.Cells[col,i+1];
    end;

  frm.gs.Rows[nLine-1].Clear;
  nLine := nLine - 1;
  frm.gs.RowCount := nLine;
  frm.RollBack.Enabled := true;
  frm.SaveCng.Enabled  := true;
  //ShowMessage('DelRecClick');
end;  // Tfrm.DelRecClick(Sender: TObject)

procedure Tfrm.DelRecOraClick(Sender: TObject);
var
  row    : integer;
  col, i : Integer;
  nLine  : integer;
begin
  nLine := frm.gso.RowCount;
  nCol  := frm.gso.ColCount;
  row   := frm.gso.Row;

  if frm.gso.RowCount = 1 then exit;
  if frm.gso.Row = 0 then exit;

  delLenOra := delLenOra + 1;
  setlength(delArrOra,delLenOra);
  delArrOra[delLenOra-1] := frm.gso.Cells[0,row];
  //ShowMessage(delArrOra[delLenOra-1]);

  if nLine = 2 then
  begin
    frm.gso.Rows[1].Clear;
    nLine := 1;
    frm.gso.RowCount := 1;
    exit;
  end;

  for i := row to nLine-2 do
    for col := 0 to nCol-1 do
    begin
      frm.gso.Cells[col,i] := frm.gso.Cells[col,i+1];
    end;

  frm.gso.Rows[nLine-1].Clear;
  nLine := nLine - 1;
  frm.gso.RowCount := nLine;
  frm.RollBack.Enabled := true;
  frm.SaveCng.Enabled  := true;
end;

procedure Tfrm.SaveCngClick(Sender: TObject);
{-------------------------------------------}
var
  i, nStr, nLine, col, row : integer;
  str : String;
begin

  if (cngLen + insLen + delLen) = 0 then
  begin
    ShowMessage('������� ��������� �� ����');
    exit;
  end;

  try
    query.Open;
  except
    ShowMessage('������ ���������� � ����� ������. ���������� ��� ���');
    exit;
  end;

  if delLen > 0 then // ���� ��������
  begin
    //query.SQL.Text := 'select * from ' + TARGET + ' order by ID';
    for i := 0 to delLen-1 do
    begin
      if delArr[i] = '' then continue;
      //ShowMessage('������� ID='+delArr[i]);
      query.SQL.Clear;
      str := 'delete from ' + SOURCE + ' where ID=' + delArr[i] + ';';
      query.SQL.Text := str;
      query.ExecSQL;
    end;
  end;

  //ShowMessage(IntToStr(cngLen));
  if cngLen > 0 then  // ���� ���������
    for row := 1 to frm.gs.RowCount-1 do
    begin
      if frm.gs.Cells[0,row] = '' then continue;
      for i := 0 to cngLen-1 do
      begin
        //ShowMessage(frm.gs.Cells[0,row] + ' <---> ' + cngArr[i]);
        if frm.gs.Cells[0,row] = cngArr[i] then
        begin
          //ShowMessage('��������� ID='+cngArr[i]);
          str := 'update ' + SOURCE + ' set '
          + 'DATA = ''' + TranDate(frm.gs.Cells[1,row]) + ''', '
          + 'NAIMENOVANIE = ''' + TrimStr(frm.gs.Cells[2,row]) + ''', '
          + 'MASSA = ' + frm.gs.Cells[3,row] + ', '
          + 'KOLICHESTVO_VAGONOV = ' + frm.gs.Cells[4,row] + ' '
          + 'where ID=' + cngArr[i] + ';';
          //ShowMessage(str);

          query.SQL.Clear;
          query.SQL.Text := str;
          query.ExecSQL;
        end;
      end;
    end;

  if insLen > 0 then
    nLine := frm.gs.RowCount;
    for row := 0 to nLine-1 do
    begin
      //ShowMessage('��������� '+IntToStr(insLen));
      if frm.gs.Cells[0,row] = '' then
      begin
        if frm.gs.Cells[2,row] = '' then frm.gs.Cells[2,row] := '���� �� ���������';
        if frm.gs.Cells[3,row] = '' then frm.gs.Cells[3,row] := '0';
        if frm.gs.Cells[4,row] = '' then frm.gs.Cells[4,row] := '0';

        str := 'insert into ' + SOURCE
        + ' ('
        + 'DATA, '
        + 'NAIMENOVANIE, '
        + 'MASSA, '
        + 'KOLICHESTVO_VAGONOV'
        + ') values '
        + ' ('
        + '''' + TranDate(frm.gs.Cells[1,row]) + ''', '
        + '''' + TrimStr(frm.gs.Cells[2,row]) + ''', '
        + frm.gs.Cells[3,row] + ', '
        + frm.gs.Cells[4,row]
        + ');';
        //ShowMessage(str);
        query.SQL.Clear;
        query.SQL.Text := str;
        query.ExecSQL;
      end;
    end;

  Button('off');
  RefreshGridSource();
  ApplyCngToTarget();
  RefreshGridTarget();
  Button('on');
  //pc.ActivePage := p2;

end;  // Tfrm.SaveCngClick(Sender: TObject)

procedure Tfrm.SaveCngOraClick(Sender: TObject);
{-------------------------------------------}
var
  i, nStr, nLine, col, row : integer;
  data, str, strx : String;
  //data : TDateTime;


begin   // Tfrm.SaveCngOraClick(Sender: TObject);
  if (cngLenOra + insLenOra + delLenOra) = 0 then
  begin
    ShowMessage('������� ��������� �� ����');
    exit;
  end;

  queryo.SQL.Clear;
  queryo.Close;
  queryo.SQL.Text := 'select * from ' + SOURCEO + ';';

  if delLenOra > 0 then // ���� ��������
  begin
    for i := 0 to delLenOra-1 do
    begin
      if delArrOra[i] = '' then continue;
      ShowMessage('������� ID='+delArrOra[i]);

      cmd.CommandText := 'DELETE ' + SOURCEO + ' WHERE ID = ' + delArrOra[i];
      try
        //queryo.Open;
        cmd.Execute;
      except
        ShowMessage('������ ���������� � ����� Oracle. ���������� ��� ���');
        exit;
      end;
    end;
  end;

  //ShowMessage(IntToStr(cngLen));
  if cngLenOra > 0 then  // ���� ���������
    for row := 1 to frm.gso.RowCount-1 do
    begin
      if frm.gso.Cells[0,row] = '' then continue;
      for i := 0 to cngLenOra-1 do
      begin
        //ShowMessage(frm.gs.Cells[0,row] + ' <---> ' + cngArr[i]);
        if frm.gso.Cells[0,row] = cngArrOra[i] then
        begin
          //ShowMessage('��������� ID='+cngArr[i]);
          data := TranDate(frm.gso.Cells[1,row]);
          str := 'update ' + SOURCEO + ' set '
          + 'DATA = to_date(''' + data + ''',''YYYYMMDD''), '
          + 'NAIMENOVANIE = ''' + TrimStr(frm.gso.Cells[2,row]) + ''', '
          + 'MASSA = ' + frm.gso.Cells[3,row] + ', '
          + 'KOLICHESTVO_VAGONOV = ' + frm.gso.Cells[4,row] + ' '
          + 'where ID=' + cngArrOra[i];
         SaveText(str);

          cmd.CommandText := str;
          try
            cmd.Execute;
          except
            ShowMessage('������ ���������� � ����� Oracle. ���������� ��� ���');
            exit;
          end;
        end;
      end;
    end;

  if insLenOra > 0 then
   begin   //1
    nLine := frm.gso.RowCount;
    for row := 0 to nLine-1 do
    begin  //2
      //ShowMessage('��������� '+IntToStr(insLen));
      if frm.gso.Cells[0,row] = '' then
      begin
        if frm.gso.Cells[2,row] = '' then frm.gso.Cells[2,row] := '���� �� ��������� Oracle';
        if frm.gso.Cells[3,row] = '' then frm.gso.Cells[3,row] := '0';
        if frm.gso.Cells[4,row] = '' then frm.gso.Cells[4,row] := '0';

        data := TranDate(frm.gso.Cells[1,row]);
        str := 'insert into ' + SOURCEO
        + ' ('
        + 'DATA'
        + ', NAIMENOVANIE'
        + ', MASSA'
        + ', KOLICHESTVO_VAGONOV'
        + ', id_brigady'
        + ', id_lokomotiva'
        + ', id_postavschika'
        + ', id_doc'
        + ') values '
        + ' ('
        + 'to_date(''' + data + ''',''YYYYMMDD''), '
        + '''' + TrimStr(frm.gso.Cells[2,row]) + ''', '
        + frm.gso.Cells[3,row] + ', '
        + frm.gso.Cells[4,row]
        + ', null, null, null, null)';
        //ShowMessage(str);
       //SaveText(str);

        cmd.CommandText := str;
        try
          cmd.Execute;
        except
          ShowMessage('������ ���������� � ����� Oracle. ���������� ��� ���');
          exit;
        end;

      end;
    end;
  end;

  queryo.SQL.Clear;
  queryo.Close;

  Button('off');
  RefreshGridSourceOra();
  //ApplyCngToTarget();
  //RefreshGridTarget();
  Button('on');


end;  // Tfrm.SaveCngOraClick(Sender: TObject)


function ApplyCngToTarget() : integer;
var
  str : String;
begin
  //Button('off');
  query.Close;
  query.SQL.Clear;
  query.SQL.Add('use [sqlmes] ');
  query.ExecSQL;
  query.SQL.Clear;

  str := 'DECLARE '#13#10
  //+ '@return_value int,'#13#10
  + '@sourcetablesql nvarchar (50);'#13#10
  + 'set @sourcetablesql = ''' + sourceTableSql + ''';'#13#10
  + 'exec sqlmes.dbo.ssis_demo @sourcetablesql;'#13#10;
//  + 'EXEC	@return_value = [dbo].[ssis_rusalka_transfer_xml] @sourcefolder;'#13#10
//  + 'SELECT	''Return Value'' = @return_value'#13#10;
  //ShowMessage(str);

  query.SQL.Text := str;
  query.ExecSQL;
  query.Close;

  RefreshGridSource();
  RefreshGridTarget();
  //Button('on');
end;  // ApplyCngToTarget()

procedure Tfrm.gsSetEditText(Sender: TObject; ACol, ARow: Integer;
  const Value: string);
var
  i, flag : Integer;
label gotoOra;

begin
  //ShowMessage(gs.Cells[0,gs.Row]);
  if gs.Cells[0,gs.Row] <> '' then
  begin
    flag := 0;

    if cngLen = 0 then
    begin
      cngLen := cngLen + 1;
      setlength(cngArr,cngLen);
      cngArr[cngLen-1] := gs.Cells[0,gs.Row];
      frm.RollBack.Enabled := true;
      frm.SaveCng.Enabled  := true;
    //ShowMessage('�������� ������ ID=' + cngArr[cngLen-1]);
      goto gotoOra;
    end;

    for i := 0 to cngLen-1 do
    begin
      if cngArr[i] = gs.Cells[0,gs.Row] then
      begin
        flag := 1;
        goto gotoOra;
      end;
    end;

    if flag = 0 then
    begin
      cngLen := cngLen + 1;
      setlength(cngArr,cngLen);
      cngArr[cngLen-1] := gs.Cells[0,gs.Row];
      frm.RollBack.Enabled := true;
      frm.SaveCng.Enabled  := true;
    end;
  end;

  gotoOra:
  if gso.Cells[0,gso.Row] <> '' then
  begin
    flag := 0;

    if cngLenOra = 0 then
    begin
      cngLenOra := cngLenOra + 1;
      setlength(cngArrOra,cngLenOra);
      cngArrOra[cngLenOra-1] := gso.Cells[0,gso.Row];
      frm.RollBack.Enabled := true;
      frm.SaveCng.Enabled  := true;
    //ShowMessage('�������� ������ ID=' + cngArr[cngLen-1]);
      exit;
    end;

    for i := 0 to cngLenOra-1 do
    begin
      if cngArrOra[i] = gso.Cells[0,gso.Row] then
      begin
        flag := 1;
        exit;
      end;
    end;

    if flag = 0 then
    begin
      cngLenOra := cngLenOra + 1;
      setlength(cngArrOra,cngLenOra);
      cngArrOra[cngLenOra-1] := gso.Cells[0,gso.Row];
      frm.RollBack.Enabled := true;
      frm.SaveCng.Enabled  := true;
    end;
  end;

end;


procedure Tfrm.pcDrawTab(Control: TCustomTabControl; TabIndex: Integer;
  const Rect: TRect; Active: Boolean);
begin
  Brush.Color := RGB(240, 240, 240);
end;

procedure Tfrm.RollBackClick(Sender: TObject);
begin
  RefreshGridSource();
  cngLen := 0;
  delLen := 0;
  insLen := 0;
end;

procedure Tfrm.RollBackOraClick(Sender: TObject);
begin
  RefreshGridSourceOra();
  cngLen := 0;
  delLen := 0;
  insLen := 0;
end;

Function TranDate(date : String) : String;
var
  res : String;
  today : TDateTime;
begin
  today := now;
  if date = '' then date := DateToStr(today);
  res := Copy(date,7,4) + Copy(date,4,2) + Copy(date,1,2);
  //ShowMessage(res);
  result := res;
end;

Function TrimStr(str : String) : String;
begin
  result := Copy(str,1,79);
end;

Function RefreshGridSource() : integer;
var
  nRow, sRow, col, row : integer;
  str : String;

begin

  sRow := frm.gs.RowCount;

  for row := 1 to sRow-1 do frm.gs.Rows[row].Clear;
  frm.gs.RowCount := 2;

  str := 'select * from ' + SOURCE + ' order by ID';
  //ShowMessage(str);

  query.SQL.Clear;
  query.Close;
  query.SQL.Text := str;
  try
    query.Open;
  except
    ShowMessage('������ ���������� � ����� ������. ���������� ��� ���');
    exit;
  end;

  nRow := query.RecordCount;
  frm.gs.RowCount := nRow + 1;

  row := 1;
  query.First;
  while not query.Eof do
    begin
      frm.gs.Cells[0,row] := query.FieldValues['ID'];
      frm.gs.Cells[1,row] := query.FieldValues['DATA'];
      frm.gs.Cells[2,row] := query.FieldValues['NAIMENOVANIE'];
      frm.gs.Cells[3,row] := query.FieldValues['MASSA'];
      frm.gs.Cells[4,row] := query.FieldValues['KOLICHESTVO_VAGONOV'];
      query.Next;
      row := row + 1;
    end;

  query.Close;
  result := 0;
end;  // RefreshGridSource()

Function RefreshGridSourceOra() : integer;
var
  nRow, sRow, col, row : integer;
  str : String;

begin

  sRow := frm.gso.RowCount;

  for row := 1 to sRow-1 do frm.gso.Rows[row].Clear;
  frm.gso.RowCount := 2;

  str := 'select * from ' + SOURCEO + ';';
  //ShowMessage(str);

  queryo.SQL.Clear;
  queryo.Close;
  queryo.SQL.Text := str;
  //ShowMessage(queryo.ConnectionString);
  //ShowMessage(queryo.SQL.Text);
  try
    queryo.Open;
  except
    ShowMessage('������ ���������� � ����� Oracle. ���������� ��� ���');
    exit;
  end;

  nRow := queryo.RecordCount;
  frm.gso.RowCount := nRow + 1;

  row := 1;
  queryo.First;
  while not queryo.Eof do
    begin
      frm.gso.Cells[0,row] := queryo.FieldValues['ID'];
      frm.gso.Cells[1,row] := queryo.FieldValues['DATA'];
      frm.gso.Cells[2,row] := queryo.FieldValues['NAIMENOVANIE'];
      frm.gso.Cells[3,row] := queryo.FieldValues['MASSA'];
      frm.gso.Cells[4,row] := queryo.FieldValues['KOLICHESTVO_VAGONOV'];
      queryo.Next;
      row := row + 1;
    end;

  queryo.Close;
  result := 0;
end;  // RefreshGridSourceOra()

Function RefreshGridTarget() : integer;
var
  nRow, nLine, gRow, col, row : integer;
  str : String;
begin

  gRow := frm.gt.RowCount;
  nLine := frm.gt.RowCount;

  for row := 1 to gRow-1 do frm.gt.Rows[row].Clear;
  frm.gt.RowCount := 2;

  query.SQL.Text := 'select * from ' + TARGET + ' where systemcode like ''%' + sourceTableSql + '%'' order by cast(ID as int)';
  try
    query.Open;
  except
    ShowMessage('������ ���������� � ����� ������. ���������� ��� ���');
    exit;
  end;

  nRow := query.RecordCount;
  frm.gt.RowCount := nRow + 1;
  nLine := frm.gt.RowCount;

  //ShowMessage(IntToStr(nRow));

  row := 1;
  query.First;
  while not query.Eof do
    begin
      frm.gt.Cells[0,row] := query.FieldValues['ID'];
      frm.gt.Cells[1,row] := query.FieldValues['DATA'];
      frm.gt.Cells[2,row] := query.FieldValues['NAIMENOVANIE'];
      frm.gt.Cells[3,row] := query.FieldValues['MASSA'];
      frm.gt.Cells[4,row] := query.FieldValues['KOLICHESTVO_VAGONOV'];
      query.Next;
      row := row + 1;
    end;

  query.Close;
  result := 0;
end;  // RefreshGridTarget() : integer

Function RefreshGridTargetFolderXML() : integer;
var
  nRow, gRow, col, row : integer;
  str : String;

begin

  gRow := frm.gt_xml2tab1.RowCount;

  for row := 1 to gRow-1 do frm.gt_xml2tab1.Rows[row].Clear;
  frm.gt_xml2tab1.RowCount := 2;

  str := 'select * from ' + TARGET + ' where filename like (''%' + sourceFolder + '%'') order by ID';
  //ShowMessage(str);

  query.Close;
  query.SQL.Clear;
  query.SQL.Text := str;
  try
    query.Open;
  except
    ShowMessage('������ ���������� � ����� ������. ���������� ��� ���');
    exit;
  end;

  nRow := query.RecordCount;
  frm.gt_xml2tab1.RowCount := nRow + 1;

  row := 1;
  query.First;
  while not query.Eof do
    begin
      frm.gt_xml2tab1.Cells[0,row] := query.FieldValues['ID'];
      frm.gt_xml2tab1.Cells[1,row] := query.FieldValues['DATA'];
      frm.gt_xml2tab1.Cells[2,row] := query.FieldValues['NAIMENOVANIE'];
      frm.gt_xml2tab1.Cells[3,row] := query.FieldValues['MASSA'];
      frm.gt_xml2tab1.Cells[4,row] := query.FieldValues['KOLICHESTVO_VAGONOV'];
      query.Next;
      row := row + 1;
    end;

  query.Close;
  result := 0;
end;

Function Button(mode : String) : integer;
begin
  if mode = 'on' then
    begin
      frm.RollBack.Enabled := true;
      frm.SaveCng.Enabled := true;
      frm.DelRec.Enabled := true;
      frm.AddRec.Enabled := true;
      frm.CloseAll.Enabled := true;
    end
  else
    begin
      frm.RollBack.Enabled := false;
      frm.SaveCng.Enabled := false;
      frm.DelRec.Enabled := false;
      frm.AddRec.Enabled := false;
      frm.CloseAll.Enabled := false;
    end
end;


function SaveText(text : String) : integer;
  Var f:System.Text; //����� ���������� �����
begin
   AssignFile(f,'c:\temp\qwerty.sql'); //����������� �����
   Rewrite(f); //�������� �����, ���� �� ��� ����, �� ����������������� (������ ����������, ����� ������ �����������)
   //Reset(f); //������ ��������� ���� ��� ��������������
   //WriteLn(f,'text'); //���������� ������ � ���� � ��������� ������� �� ����� ������
   Write(f,text); //���������� ������ � ���� ��� �������� ������� �� ����� ������
   CloseFile(f); //��������� ����
end;



end.  // End of application
