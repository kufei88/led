unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,LedDll, DB, ADODB, AdvEdit, AdvEdBtn, AdvFileNameEdit,IniFiles,
  ExtCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Memo1: TMemo;
    lbl1: TLabel;
    edt1: TEdit;
    con1: TADOConnection;
    qry1: TADOQuery;
    lbl2: TLabel;
    leftFile: TAdvFileNameEdit;
    Label1: TLabel;
    rightFile: TAdvFileNameEdit;
    con2: TADOConnection;
    qry2: TADOQuery;
    tmr1: TTimer;
    btn1: TButton;
    con3: TADOConnection;
    con4: TADOConnection;
    qry3: TADOQuery;
    qry4: TADOQuery;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tmr1Timer(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure leftFileChange(Sender: TObject);
    procedure rightFileChange(Sender: TObject);
  private
    { Private declarations }
    procedure saveinifile(memName:String;memvalue:string);
    function getinifile(memName:string):string;
    function getwd(sourcepath:string):string;
    procedure writelog(log:string);
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
var
    logf:TLOGFONT;
begin
  leftFile.Text := getinifile('左边');
  rightFile.Text := getinifile('右边');
end;

procedure TForm1.Button2Click(Sender: TObject);
var
    nResult:Integer;
    LedCommunicationInfo:COMMUNICATIONINFO;
    ErrStr:Array [0..255] of Char;
    hProgram:Integer;
    ARect:AREARECT;
    FProp:FONTPROP;
begin
//tcp通讯********************************************
    LedCommunicationInfo.SendType:=0;
    strpcopy(LedCommunicationInfo.IpStr,'192.168.1.187');
    LedCommunicationInfo.LedNumber:=1;
 //广播发送*********************************************
    //LedCommunicationInfo.SendType:=1;
 //串口通讯*********************************************
    //LedCommunicationInfo.SendType:=2;
    //LedCommunicationInfo.Commport:=1;
    //LedCommunicationInfo.Baud:=9600;
    //LedCommunicationInfo.LedNumber:=1;
    hProgram:=LV_CreateProgram(64,32,2);
    LV_AddProgram(hProgram,1,0,1);
    ARect.left:=0;
    ARect.top:=0;
    ARect.width:=64;
    ARect.height:=32;

    FillChar(FProp,sizeof(FProp),0);
    strpcopy(FProp.FontName,'宋体');
    FProp.FontSize:=12;
    FProp.FontColor:=COLOR_RED;

    LV_QuickAddSingleLineTextArea(hProgram,1,1,@ARect,ADDTYPE_STRING,PChar('胡半仙到此一游~'),@FProp,4);


    nResult:=LV_Send(@LedCommunicationInfo,hProgram);
    LV_DeleteProgram(hProgram);
    if nResult<>OK then
        begin
            LV_GetError(nResult,256,ErrStr);
            ShowMessage(ErrStr);
        end
    else
        begin
            ShowMessage('发送成功');
        end;
end;

procedure TForm1.Button1Click(Sender: TObject);
var
    nResult:Integer;
    LedCommunicationInfo:COMMUNICATIONINFO;
    ErrStr:Array [0..255] of Char;
begin
//tcp通讯********************************************
    LedCommunicationInfo.SendType:=1;
   // strpcopy(LedCommunicationInfo.IpStr,'192.168.1.187');
    LedCommunicationInfo.LedNumber:=1;
 //广播发送*********************************************
    //LedCommunicationInfo.SendType:=1;
 //串口通讯*********************************************
    //LedCommunicationInfo.SendType:=2;
    //LedCommunicationInfo.Commport:=1;
    //LedCommunicationInfo.Baud:=9600;
    //LedCommunicationInfo.LedNumber:=1;


    nResult:=LV_SetBasicInfo(@LedCommunicationInfo,2,448,210);
    if nResult<>OK then
        begin
            LV_GetError(nResult,256,ErrStr);
            ShowMessage(ErrStr);
        end
    else
        begin
            ShowMessage('设置屏参成功');
        end;
end;

procedure TForm1.Button4Click(Sender: TObject);
var
    nResult:Integer;
    LedCommunicationInfo:COMMUNICATIONINFO;
    ErrStr:Array [0..255] of Char;
    hProgram:Integer;
    ARect:AREARECT;
    PProp:PLAYPROP;
begin
//tcp通讯********************************************
    LedCommunicationInfo.SendType:=0;
    strpcopy(LedCommunicationInfo.IpStr,'192.168.1.187');
    LedCommunicationInfo.LedNumber:=1;
 //广播发送*********************************************
    //LedCommunicationInfo.SendType:=1;
 //串口通讯*********************************************
    //LedCommunicationInfo.SendType:=2;
    //LedCommunicationInfo.Commport:=1;
    //LedCommunicationInfo.Baud:=9600;
    //LedCommunicationInfo.LedNumber:=1;
    hProgram:=LV_CreateProgram(64,32,2);
    LV_AddProgram(hProgram,1,0,1);
    ARect.left:=0;
    ARect.top:=0;
    ARect.width:=64;
    ARect.height:=32;

    LV_AddImageTextArea(hProgram, 1, 1, @ARect, 0);


    FillChar(PProp,sizeof(PProp),0);
    PProp.InStyle:=0;
    PProp.DelayTime:=3;
    PProp.Speed:=4;

    //可以添加多个子项到图文区，如下添加可以选一个或多个添加
    nResult:=LV_AddFileToImageTextArea(hProgram,1,1,PChar('test.bmp'),@PProp);
    nResult:=LV_AddFileToImageTextArea(hProgram,1,1,PChar('test.jpg'),@PProp);
    nResult:=LV_AddFileToImageTextArea(hProgram,1,1,PChar('test.png'),@PProp);
    nResult:=LV_AddFileToImageTextArea(hProgram,1,1,PChar('test.gif'),@PProp);

    nResult:=LV_Send(@LedCommunicationInfo,hProgram);
    LV_DeleteProgram(hProgram);
    if nResult<>OK then
        begin
            LV_GetError(nResult,256,ErrStr);
            ShowMessage(ErrStr);
        end
    else
        begin
            ShowMessage('发送成功');
        end;
end;

procedure TForm1.Button3Click(Sender: TObject);
var
    nResult:Integer;
    LedCommunicationInfo:COMMUNICATIONINFO;
    tempstr,tempstr1:widestring;
    ErrStr:Array [0..255] of Char;
    hProgram:Integer;
    ARect:AREARECT;
    FProp:FONTPROP;
    PProp:PLAYPROP;
    leftDBFile,rightDBFile,leftDBFile1,rightDBFile1:string;
    wText: TextFile;
    function getansilength(str:string):integer;
    var
      tempstr:AnsiString;
    begin
      tempstr := str;
      Result := Length(tempstr);
    end;
    function getspaceByNumber(number:integer):string;
    var
      i,count:Integer;
      str:string;
    begin
      str := '';
      count := 34-number;
      for i:=0 to count -1 do
      begin
        str := str + ' ';
      end;
      Result := str;
    end;
begin
  if leftFile.Text = '' then
  begin
    MessageBox(self.Handle,'提示','请先设置左边屏幕的数据文件',MB_OK+mb_iconinformation);
    Exit;
  end;
  if rightFile.Text = '' then
  begin
    MessageBox(self.Handle,'提示','请先设置右边屏幕的数据文件',MB_OK+mb_iconinformation);
    Exit;
  end;
  //leftDBFile := extractfilepath(leftFile.Text)+'PJ'+FormatDateTime('YYYYMM',now)+'.mdb';
  leftDBFile :=  extractfilepath(leftFile.Text)+'task.mdb';
  leftDBFile1 :=  extractfilepath(leftFile.Text)+'rank.mdb';
  if not FileExists(leftDBFile) then
  begin
    MessageBox(self.Handle,'提示','左边屏幕的数据文件不能存在',MB_OK+mb_iconinformation);
    Exit;
  end;
  rightDBFile := extractfilepath(rightFile.Text)+'task.mdb';
  rightDBFile1 := extractfilepath(rightFile.Text)+'rank.mdb';
  if not FileExists(rightDBFile) then
  begin
    MessageBox(self.Handle,'提示','右边屏幕的数据文件不能存在',MB_OK+mb_iconinformation);
    Exit;
  end;
  writelog(leftDBFile);
  writelog(rightDBFile);
  
  con1.Connected := False;
  con1.ConnectionString := 'Provider=Microsoft.Jet.OLEDB.4.0;Password="";Data Source='+leftdbfile+';Persist Security Info=True';
  con1.Connected := True;
  con3.Connected := False;
  con3.ConnectionString := 'Provider=Microsoft.Jet.OLEDB.4.0;Password="";Data Source='+leftdbfile1+';Persist Security Info=True';
  con3.Connected := True;
  qry3.Close;
  qry3.SQL.Text := 'select top 1 * from record order by sort';

  qry3.Open;
  qry1.Close;
  qry1.SQL.Text := 'select * from taskrecord where job_no='''+qry3.fieldbyname('job_no').asstring+'''';
  qry1.Open;

  con2.Connected := False;
  con2.ConnectionString := 'Provider=Microsoft.Jet.OLEDB.4.0;Password="";Data Source='+rightdbfile+';Persist Security Info=True';
  con2.Connected := True;
  con4.Connected := False;
  con4.ConnectionString := 'Provider=Microsoft.Jet.OLEDB.4.0;Password="";Data Source='+rightdbfile1+';Persist Security Info=True';
  con4.Connected := True;
  qry4.Close;
  qry4.SQL.Text := 'select top 1 * from record order by sort';
  qry4.Open;
  qry2.Close;
  qry2.SQL.Text := 'select * from taskrecord where job_no='''+qry4.fieldbyname('job_no').asstring+'''';
  qry2.Open;
  //writelog(qry1.fieldbyname('cust_nm').asstring);
  //writelog(qry2.fieldbyname('cust_nm').asstring);
  //writelog(qry1.fieldbyname('id').asstring);
  //writelog(qry2.fieldbyname('id').asstring);
  AssignFile(wText, 'test.txt');
  Rewrite(wText);//创建文件，或者使用ReSet打开文件

  Writeln(wText, '      发货编号:'+qry1.fieldbyname('Job_No').asstring+getspaceByNumber(8+getansilength(qry1.fieldbyname('Job_No').asstring))+qry2.fieldbyname('Job_No').asstring);
  Writeln(wText, '      项目:'+copy(qry1.fieldbyname('txta1').asstring,1,14)+
  getspaceByNumber(4+getansilength(Copy(qry1.fieldbyname('txta1').asstring,1,14)))+copy(qry2.fieldbyname('txta1').asstring,1,14));
  Writeln(wText, '      '+Copy(qry1.fieldbyname('txta1').asstring,15,100)+
  getspaceByNumber(getansilength(Copy(qry1.fieldbyname('txta1').asstring,15,100)))+copy(qry2.fieldbyname('txta1').asstring,15,100));
  Writeln(wText, '      施工单位:'+qry1.fieldbyname('txta3').asstring+getspaceByNumber(8+getansilength(qry1.fieldbyname('txta3').asstring))+qry2.fieldbyname('txta3').asstring);
  tempstr :=  qry1.fieldbyname('txta5').asstring;
  tempstr1 := qry2.fieldbyname('txta5').asstring;
  Writeln(wText, '      施工部位:'+copy(tempstr,1,7)+
  getspaceByNumber(8+getansilength(Copy(tempstr,1,7)))+copy(tempstr1,1,7));
  Writeln(wtext, '      '+Copy(tempstr,8,100)+getspaceByNumber(getansilength(Copy(tempstr,8,100)))+
  copy(tempstr1,8,100));
  tempstr := getwd(leftFile.Text);
  tempstr1 := getwd(rightFile.Text);
  Writeln(wText, '      砼强度:'+tempstr+getspaceByNumber(6+getansilength(tempstr))+tempstr1);
  tempstr := Copy(qry1.fieldbyname('edittime').AsString,1,10);
  tempstr1 := Copy(qry2.fieldbyname('edittime').AsString,1,10);
  Writeln(wText, '      发货日期:'+tempstr+getspaceByNumber(8+getansilength(tempstr))+tempstr1);
  //Writeln(wText, '      到达地点:'+qry1.fieldbyname('curtime').asstring+getspaceByNumber(8+getansilength(qry1.fieldbyname('curtime').asstring))+qry2.fieldbyname('curtime').asstring);
  Writeln(wText, '      备注:'+qry1.fieldbyname('txta7').asstring+getspaceByNumber(4+getansilength(qry1.fieldbyname('txta7').asstring))+qry2.fieldbyname('txta7').asstring);
  Writeln(wText, '      本车方量:'+qry3.fieldbyname('truck_vol').asstring+getspaceByNumber(8+getansilength(qry3.fieldbyname('truck_vol').asstring))+qry4.fieldbyname('truck_vol').asstring);
  Writeln(wText, '      累计方量:'+qry1.fieldbyname('sumarfs').asstring+getspaceByNumber(8+getansilength(qry1.fieldbyname('sumarfs').asstring))+qry2.fieldbyname('sumarfs').asstring);
  Writeln(wText, '      累计车次:'+qry1.fieldbyname('sumarcs').asstring+getspaceByNumber(8+getansilength(qry1.fieldbyname('sumarcs').asstring))+qry2.fieldbyname('sumarcs').asstring);
  Writeln(wText, '      车号:'+qry3.fieldbyname('Truck_No').asstring+getspaceByNumber(4+getansilength(qry3.fieldbyname('Truck_No').asstring))+qry4.fieldbyname('Truck_No').asstring);
  Writeln(wText, '      驾驶员:'+qry3.fieldbyname('driver').asstring+getspaceByNumber(6+getansilength(qry3.fieldbyname('driver').asstring))+qry4.fieldbyname('driver').asstring);
  CloseFile(wText);
//tcp通讯********************************************
    LedCommunicationInfo.SendType:=1;
   // strpcopy(LedCommunicationInfo.IpStr,'192.168.1.187');
    LedCommunicationInfo.LedNumber:=1;
 //广播发送*********************************************
    //LedCommunicationInfo.SendType:=1;
 //串口通讯*********************************************
    //LedCommunicationInfo.SendType:=2;
    //LedCommunicationInfo.Commport:=1;
    //LedCommunicationInfo.Baud:=9600;
    //LedCommunicationInfo.LedNumber:=1;
    hProgram:=LV_CreateProgram(448,210,2);
    LV_AddProgram(hProgram,1,0,1);
    ARect.left:=0;
    ARect.top:=0;
    ARect.width:=448;
    ARect.height:=210;

    LV_AddImageTextArea(hProgram, 1, 1, @ARect, 0);

    FillChar(FProp,sizeof(FProp),0);
    strpcopy(FProp.FontName,'宋体');
    FProp.FontSize:=10;
    FProp.FontColor:=COLOR_RED;

    FillChar(PProp,sizeof(PProp),0);
    PProp.InStyle:=0;
    PProp.DelayTime:=1;
    PProp.Speed:=1;


 	nResult:=LV_AddStaticTextToImageTextArea(hProgram,1,1,ADDTYPE_FILE,PChar('test.txt'),@FProp,65535,0,0);//通过txt文件添加一个多行文本到图文区，参数说明见声明注示




    nResult:=LV_Send(@LedCommunicationInfo,hProgram);
    LV_DeleteProgram(hProgram);
    if nResult<>OK then
        begin
            LV_GetError(nResult,256,ErrStr);
            ShowMessage(ErrStr);
        end
    else
        begin
            ShowMessage('发送成功');
        end;
   con1.Close;
   con2.Close;
end;

procedure TForm1.Button5Click(Sender: TObject);
var
    nResult:Integer;
    LedCommunicationInfo:COMMUNICATIONINFO;
    ErrStr:Array [0..255] of Char;
    hProgram:Integer;
    ARect:AREARECT;
    FProp:FONTPROP;
    DigitalClockInfo:DIGITALCLOCKAREAINFO;
begin
//tcp通讯********************************************
    LedCommunicationInfo.SendType:=1;
   // strpcopy(LedCommunicationInfo.IpStr,edt1.Text);
    LedCommunicationInfo.LedNumber:=1;
 //广播发送*********************************************
    //LedCommunicationInfo.SendType:=1;
 //串口通讯*********************************************
    //LedCommunicationInfo.SendType:=2;
    //LedCommunicationInfo.Commport:=1;
    //LedCommunicationInfo.Baud:=9600;
    //LedCommunicationInfo.LedNumber:=1;
    hProgram:=LV_CreateProgram(64,32,2);
    LV_AddProgram(hProgram,1,0,1);


    FillChar(FProp,sizeof(FProp),0);
    strpcopy(FProp.FontName,'宋体');
    FProp.FontSize:=12;
    FProp.FontColor:=COLOR_RED;

    ARect.left:=0;
    ARect.top:=0;
    ARect.width:=64;
    ARect.height:=16;

    LV_QuickAddSingleLineTextArea(hProgram,1,1,@ARect,ADDTYPE_STRING,PChar('上海灵信视觉技术股份有限公司'),@FProp,4);

    ARect.left:=0;
    ARect.top:=16;
    ARect.width:=64;
    ARect.height:=16;
    FillChar(DigitalClockInfo,sizeof(DigitalClockInfo),0);
    DigitalClockInfo.TimeColor:=COLOR_RED;
    strpcopy(DigitalClockInfo.ShowStrFont.FontName,'宋体');
    DigitalClockInfo.ShowStrFont.FontSize:=12;
    DigitalClockInfo.IsShowHour:=1;
    DigitalClockInfo.IsShowMinute:=1;

    LV_AddDigitalClockArea(hProgram,1,2,@ARect,@DigitalClockInfo);

    nResult:=LV_Send(@LedCommunicationInfo,hProgram);
    LV_DeleteProgram(hProgram);
    if nResult<>OK then
        begin
            LV_GetError(nResult,256,ErrStr);
            ShowMessage(ErrStr);
        end
    else
        begin
            ShowMessage('发送成功');
        end;
end;

procedure TForm1.Button6Click(Sender: TObject);
var
    nResult:Integer;
    LedCommunicationInfo:COMMUNICATIONINFO;
    ErrStr:Array [0..255] of Char;
    hProgram:Integer;
    ARect:AREARECT;
    FProp:FONTPROP;
    DigitalClockInfo:DIGITALCLOCKAREAINFO;
begin
//tcp通讯********************************************
    LedCommunicationInfo.SendType:=1;
   // strpcopy(LedCommunicationInfo.IpStr,'192.168.1.245');
    LedCommunicationInfo.LedNumber:=1;
 //广播发送*********************************************
    //LedCommunicationInfo.SendType:=1;
 //串口通讯*********************************************
    //LedCommunicationInfo.SendType:=2;
    //LedCommunicationInfo.Commport:=1;
    //LedCommunicationInfo.Baud:=9600;
    //LedCommunicationInfo.LedNumber:=1;
    hProgram:=LV_CreateProgram(400,80,2);
    LV_AddProgram(hProgram,1,0,1);


    FillChar(FProp,sizeof(FProp),0);
    strpcopy(FProp.FontName,'宋体');
    FProp.FontSize:=12;
    FProp.FontColor:=COLOR_RED;

    ARect.left:=0;
    ARect.top:=0;
    ARect.width:=400;
    ARect.height:=40;

    LV_QuickAddSingleLineTextArea(hProgram,1,1,@ARect,ADDTYPE_STRING,PChar('上海灵信视觉技术股份有限公司'),@FProp,4);
    {
    ARect.left:=0;
    ARect.top:=16;
    ARect.width:=64;
    ARect.height:=16;
    FillChar(DigitalClockInfo,sizeof(DigitalClockInfo),0);
    DigitalClockInfo.TimeColor:=COLOR_RED;
    strpcopy(DigitalClockInfo.ShowStrFont.FontName,'宋体');
    DigitalClockInfo.ShowStrFont.FontSize:=12;
    DigitalClockInfo.IsShowHour:=1;
    DigitalClockInfo.IsShowMinute:=1;

    LV_AddDigitalClockArea(hProgram,1,2,@ARect,@DigitalClockInfo); }
 //**************************************************************************

    LV_AddProgram(hProgram,2,0,1);
    ARect.left:=0;
    ARect.top:=40;
    ARect.width:=400;
    ARect.height:=40;
    strpcopy(FProp.FontName,'黑体');
    FProp.FontSize:=12;
    FProp.FontColor:=COLOR_GREEN;

    LV_QuickAddSingleLineTextArea(hProgram,2,1,@ARect,ADDTYPE_STRING,PChar('胡半仙到此一游~'),@FProp,4);
    {
    ARect.left:=0;
    ARect.top:=16;
    ARect.width:=64;
    ARect.height:=16;
    FillChar(DigitalClockInfo,sizeof(DigitalClockInfo),0);
    DigitalClockInfo.TimeColor:=COLOR_RED;
    strpcopy(DigitalClockInfo.ShowStrFont.FontName,'黑体');
    DigitalClockInfo.ShowStrFont.FontSize:=12;
    DigitalClockInfo.IsShowHour:=1;
    DigitalClockInfo.IsShowMinute:=1;
    DigitalClockInfo.TimeFormat:=2;
    LV_AddDigitalClockArea(hProgram,2,2,@ARect,@DigitalClockInfo);     }

    nResult:=LV_Send(@LedCommunicationInfo,hProgram);
    LV_DeleteProgram(hProgram);
    if nResult<>OK then
        begin
            LV_GetError(nResult,256,ErrStr);
            ShowMessage(ErrStr);
        end
    else
        begin
            ShowMessage('发送成功');
        end;
end;

procedure TForm1.saveinifile(memName, memvalue: string);
var
  myIniFile: TIniFile;
  filepath:string;
begin
  filepath := ExtractFilePath(Application.Exename) + 'DBConfig.ini'; //取得ini文件的路径
  myIniFile := TIniFile.Create(filepath);
  try
    myIniFile.WriteString(memName, memName, memvalue);     //服务器地址

  finally
    myIniFile.Free;
  end;
end;

function TForm1.getinifile(memName:string): string;
var
  myIniFile: TIniFile;
  filepath:string;
begin
  filepath := ExtractFilePath(Application.Exename) + 'DBConfig.ini'; //取得ini文件的路径
  myIniFile := TIniFile.Create(filepath);
  try
    Result := myIniFile.ReadString(memname,memname,'');

  finally
    myIniFile.Free;
  end;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  saveinifile('左边',leftFile.Text);
  saveinifile('右边',rightFile.Text);
end;

procedure TForm1.writelog(log: string);
var
  wText:textfile;
  sysDir:string;
begin
{  sysDir:=extractfilepath(application.ExeName);
  AssignFile(wText, 'log.txt');
  if fileexists(sysDir+'log.txt') then
     append(wText)
  else
     rewrite(wText);
  //append(wText);//创建文件，或者使用ReSet打开文件

  Writeln(wText, log);

  CloseFile(wText);   }
end;

procedure TForm1.tmr1Timer(Sender: TObject);
var
    nResult:Integer;
    LedCommunicationInfo:COMMUNICATIONINFO;
    ErrStr:Array [0..255] of Char;
    hProgram:Integer;
    ARect:AREARECT;
    FProp:FONTPROP;
    PProp:PLAYPROP;
    leftDBFile,rightDBFile,leftDBFile1,rightDBFile1:string;
    tempstr,tempstr1:widestring;
    wText: TextFile;
    function getansilength(str:string):integer;
    var
      tempstr:AnsiString;
    begin
      tempstr := str;
      Result := Length(tempstr);
    end;
    function getspaceByNumber(number:integer):string;
    var
      i,count:Integer;
      str:string;
    begin
      str := '';
      count := 34-number;
      for i:=0 to count -1 do
      begin
        str := str + ' ';
      end;
      Result := str;
    end;
begin



  if leftFile.Text = '' then
  begin
    MessageBox(self.Handle,'请先设置左边屏幕的数据文件','提示',MB_OK+mb_iconinformation);
    Exit;
  end;
  if rightFile.Text = '' then
  begin
    MessageBox(self.Handle,'请先设置右边屏幕的数据文件','提示',MB_OK+mb_iconinformation);
    Exit;
  end;
  leftDBFile := extractfilepath(leftFile.Text)+'rank.mdb';
 // leftDBFile :=  extractfilepath(leftFile.Text)+'task.mdb';
  leftDBFile1 :=  extractfilepath(leftFile.Text)+'rank.mdb';
  if not FileExists(leftDBFile) then
  begin
    MessageBox(self.Handle,'左边屏幕的数据文件不存在','提示',MB_OK+mb_iconinformation);
    Exit;
  end;
  rightDBFile := extractfilepath(rightFile.Text)+'rank.mdb';
 // rightDBFile := extractfilepath(rightFile.Text)+'task.mdb';
  rightDBFile1 := extractfilepath(rightFile.Text)+'rank.mdb';
  if not FileExists(rightDBFile) then
  begin
    MessageBox(self.Handle,'右边屏幕的数据文件不存在','提示',MB_OK+mb_iconinformation);
    Exit;
  end;
  CopyFile(PChar(extractfilepath(leftFile.Text)+'rank.mdb'),
  PChar(extractfilepath(ParamStr(0))+'rank.mdb'),false);
  CopyFile(PChar(extractfilepath(rightFile.Text)+'rank.mdb'),
  PChar(extractfilepath(ParamStr(0))+'rank1.mdb'),false);
  Sleep(10000);
  writelog(leftDBFile);
  writelog(rightDBFile);
  try
  con1.Connected := False;
  con1.ConnectionString := 'Provider=Microsoft.Jet.OLEDB.4.0;Password="";Data Source='+
  extractfilepath(ParamStr(0))+'rank.mdb'+';Persist Security Info=True';
  con1.Connected := True;
  {
  con3.Connected := False;
  con3.ConnectionString := 'Provider=Microsoft.Jet.OLEDB.4.0;Password="";Data Source='+leftdbfile1+';Persist Security Info=True';
  con3.Connected := True;
  qry3.Close;
  qry3.SQL.Text := 'select top 1 * from record order by sort';

  qry3.Open;     }
  qry1.Close;
  qry1.SQL.Text := 'select top 1 * from record order by sort';
  qry1.Open;

  con2.Connected := False;
  con2.ConnectionString := 'Provider=Microsoft.Jet.OLEDB.4.0;Password="";Data Source='+
  extractfilepath(ParamStr(0))+'rank1.mdb'+';Persist Security Info=True';
  con2.Connected := True;
  {
  con4.Connected := False;
  con4.ConnectionString := 'Provider=Microsoft.Jet.OLEDB.4.0;Password="";Data Source='+rightdbfile1+';Persist Security Info=True';
  con4.Connected := True;
  qry4.Close;
  qry4.SQL.Text := 'select top 1 * from record order by sort';
  qry4.Open;       }
  qry2.Close;
  qry2.SQL.Text := 'select top 1 * from record order by sort';
  qry2.Open;
  except
  begin
    con1.Close;
    con2.Close;
    
  end;
  end;

  if (getinifile('左边id') = qry1.FieldByName('job_no').AsString) and (getinifile('右边id') = qry2.FieldByName('job_no').AsString) then
  begin
    con1.Close;
    con2.Close;

    Exit;

  end;
  saveinifile('左边id',qry1.FieldByName('job_no').AsString);
  saveinifile('右边id',qry2.FieldByName('job_no').AsString);
  //writelog(qry1.fieldbyname('cust_nm').asstring);
  //writelog(qry2.fieldbyname('cust_nm').asstring);
  //writelog(qry1.fieldbyname('id').asstring);
  //writelog(qry2.fieldbyname('id').asstring);
  AssignFile(wText, 'test.txt');
  Rewrite(wText);//创建文件，或者使用ReSet打开文件

  Writeln(wText, '      发货编号:'+qry1.fieldbyname('Job_No').asstring+getspaceByNumber(8+getansilength(qry1.fieldbyname('Job_No').asstring))+qry2.fieldbyname('Job_No').asstring);
 // Writeln(wText, '      项目:'+copy(qry1.fieldbyname('cust_nm').asstring,1,14)+
 // getspaceByNumber(4+getansilength(Copy(qry1.fieldbyname('cust_nm').asstring,1,14)))+copy(qry2.fieldbyname('cust_nm').asstring,1,14));
  Writeln(wText, '      项目:'+copy(qry1.fieldbyname('cust_nm').asstring,1,14)+
  getspaceByNumber(4+getansilength(Copy(qry1.fieldbyname('cust_nm').asstring,1,14)))+copy(qry2.fieldbyname('cust_nm').asstring,1,14));
  Writeln(wText, '      '+Copy(qry1.fieldbyname('cust_nm').asstring,15,100)+
  getspaceByNumber(getansilength(Copy(qry1.fieldbyname('cust_nm').asstring,15,100)))+copy(qry2.fieldbyname('cust_nm').asstring,15,100));
  tempstr := qry1.fieldbyname('proj_nm').asstring;
  tempstr1 := qry2.fieldbyname('proj_nm').asstring;
  Writeln(wText, '      施工单位:'+copy(tempstr,1,7)+
  getspaceByNumber(8+getansilength(Copy(tempstr,1,7)))+copy(tempstr1,1,7));
  Writeln(wtext, '      '+Copy(tempstr,8,100)+getspaceByNumber(getansilength(Copy(tempstr,8,100)))+
  copy(tempstr1,8,100));
  tempstr :=  qry1.fieldbyname('site_no').asstring;
  tempstr1 := qry2.fieldbyname('site_no').asstring;
  Writeln(wText, '      施工部位:'+copy(tempstr,1,7)+
  getspaceByNumber(8+getansilength(Copy(tempstr,1,7)))+copy(tempstr1,1,7));
  Writeln(wtext, '      '+Copy(tempstr,8,100)+getspaceByNumber(getansilength(Copy(tempstr,8,100)))+
  copy(tempstr1,8,100));
  tempstr := qry1.fieldbyname('prop_no').asstring;
  tempstr1 := qry2.fieldbyname('prop_no').asstring;
  Writeln(wText, '      砼强度:'+tempstr+getspaceByNumber(6+getansilength(tempstr))+tempstr1);
  tempstr := FormatDateTime('yyyy-mm-dd hh:mm:ss',now);
  tempstr1 := FormatDateTime('yyyy-mm-dd hh:mm:ss',now);
  Writeln(wText, '      发货日期:'+tempstr+getspaceByNumber(8+getansilength(tempstr))+tempstr1);
  //Writeln(wText, '      到达地点:'+qry1.fieldbyname('curtime').asstring+getspaceByNumber(8+getansilength(qry1.fieldbyname('curtime').asstring))+qry2.fieldbyname('curtime').asstring);
  Writeln(wText, '      备注:'+qry1.fieldbyname('tech_req').asstring+getspaceByNumber(4+getansilength(qry1.fieldbyname('tech_req').asstring))+qry2.fieldbyname('tech_req').asstring);
  Writeln(wText, '      本车方量:'+qry1.fieldbyname('truck_vol').asstring+getspaceByNumber(8+getansilength(qry1.fieldbyname('truck_vol').asstring))+qry2.fieldbyname('truck_vol').asstring);
  //Writeln(wText, '      累计方量:'+qry1.fieldbyname('sumarfs').asstring+getspaceByNumber(8+getansilength(qry1.fieldbyname('sumarfs').asstring))+qry2.fieldbyname('sumarfs').asstring);
 // Writeln(wText, '      累计车次:'+qry1.fieldbyname('sumarcs').asstring+getspaceByNumber(8+getansilength(qry1.fieldbyname('sumarcs').asstring))+qry2.fieldbyname('sumarcs').asstring);
  Writeln(wText, '      车号:'+qry1.fieldbyname('Truck_No').asstring+getspaceByNumber(4+getansilength(qry1.fieldbyname('Truck_No').asstring))+qry2.fieldbyname('Truck_No').asstring);
  Writeln(wText, '      驾驶员:'+qry1.fieldbyname('driver').asstring+getspaceByNumber(6+getansilength(qry1.fieldbyname('driver').asstring))+qry2.fieldbyname('driver').asstring);
  CloseFile(wText);
//tcp通讯********************************************
    LedCommunicationInfo.SendType:=1;
   // strpcopy(LedCommunicationInfo.IpStr,'192.168.1.187');
    LedCommunicationInfo.LedNumber:=1;
 //广播发送*********************************************
    //LedCommunicationInfo.SendType:=1;
 //串口通讯*********************************************
    //LedCommunicationInfo.SendType:=2;
    //LedCommunicationInfo.Commport:=1;
    //LedCommunicationInfo.Baud:=9600;
    //LedCommunicationInfo.LedNumber:=1;
    hProgram:=LV_CreateProgram(448,210,2);
    LV_AddProgram(hProgram,1,0,1);
    ARect.left:=0;
    ARect.top:=0;
    ARect.width:=448;
    ARect.height:=210;

    LV_AddImageTextArea(hProgram, 1, 1, @ARect, 0);

    FillChar(FProp,sizeof(FProp),0);
    strpcopy(FProp.FontName,'宋体');
    FProp.FontSize:=11;
    FProp.FontColor:=COLOR_RED;

    FillChar(PProp,sizeof(PProp),0);
    PProp.InStyle:=0;
    PProp.DelayTime:=1;
    PProp.Speed:=1;


 	nResult:=LV_AddStaticTextToImageTextArea(hProgram,1,1,ADDTYPE_FILE,PChar('test.txt'),@FProp,65535,0,0);//通过txt文件添加一个多行文本到图文区，参数说明见声明注示




    nResult:=LV_Send(@LedCommunicationInfo,hProgram);
    LV_DeleteProgram(hProgram);
    if nResult<>OK then
        begin
            LV_GetError(nResult,256,ErrStr);
            writelog(ErrStr);
        end
    else
        begin
            writelog('发送成功');
        end;
   con1.Close;
   con2.Close;
  
end;

procedure TForm1.btn1Click(Sender: TObject);
var
  leftDBFile,rightDBFile:string;
begin
  if leftFile.Text = '' then
  begin
    MessageBox(self.Handle,'提示','请先设置左边屏幕的数据文件',MB_OK+mb_iconinformation);
    Exit;
  end;
  if rightFile.Text = '' then
  begin
    MessageBox(self.Handle,'提示','请先设置右边屏幕的数据文件',MB_OK+mb_iconinformation);
    Exit;
  end;
  leftDBFile := extractfilepath(leftFile.Text)+'rank.mdb';
  if not FileExists(leftDBFile) then
  begin
    MessageBox(self.Handle,'左边屏幕的数据文件不能存在','提示',MB_OK+mb_iconinformation);
    Exit;
  end;
  rightDBFile := extractfilepath(rightFile.Text)+'rank.mdb';
  if not FileExists(rightDBFile) then
  begin
    MessageBox(self.Handle,'右边屏幕的数据文件不能存在','提示',MB_OK+mb_iconinformation);
    Exit;
  end;
  tmr1.Enabled := True;
  btn1.Enabled := False;
end;

function TForm1.getwd(sourcepath:string): string;
var
  myIniFile: TIniFile;
  filepath:string;
begin
  filepath := ExtractFilePath(sourcepath) + '2011WD.ini'; //取得ini文件的路径
  myIniFile := TIniFile.Create(filepath);
  try
    Result := myIniFile.ReadString('2011','4','');

  finally
    myIniFile.Free;
  end;

end;

procedure TForm1.leftFileChange(Sender: TObject);
begin
  saveinifile('左边',leftFile.Text);
end;

procedure TForm1.rightFileChange(Sender: TObject);
begin
  saveinifile('右边',rightFile.Text);
end;

end.
