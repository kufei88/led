{/*
 *****************************************************************************************************************
 *													  LED SDK 6.0
 *
 *														 胡伟
 *
 *
 *										(C) Copyright 2010 - 2015, LISTEN VISION
 *												   All Rights Reserved
 *
 *****************************************************************************************************************
 */}

unit LedDll;


interface

const
    COLOR_RED       =$ff;         //红色
    COLOR_GREEN     =$ff00;       //绿色
    COLOR_YELLOW    =$ffff;       //黄色

    ADDTYPE_STRING	=0;		      //添加类型为字串
    ADDTYPE_FILE	=1;		      //添加的类型为文件

    OK				=0;			//函数返回成功

//******节目定时启用日期时间星期的标志宏***************************************************************************
    ENABLE_DATE		=$01;
    ENABLE_TIME		=$02;
    ENABLE_WEEK		=$04;
//*****************************************************************************************************************

//******节目定时星期里某天启用宏***********************************************************
    WEEK_MON		=$01;
    WEEK_TUES		=$02;
    WEEK_WEN		=$04;
    WEEK_THUR		=$08;
    WEEK_FRI		=$10;
    WEEK_SAT		=$20;
    WEEK_SUN		=$40;
//*****************************************************************************

type
    PInteger=^Integer;
//**通讯设置结构体*********************************************************
    COMMUNICATIONINFO = record
	    LEDType:Integer;				//LED类型	0.为所有6代单色、双色、七彩卡,		1.为所有6代全彩卡
	    SendType:Integer;				//通讯方式	0.为Tcp发送（又称固定IP通讯）,		1.广播发送（又称单机直连）		2.串口通讯		3.磁盘保存
	    IpStr:Array [0..15] of Char;				//LED屏的IP地址，只有通讯方式为0时才需赋值，其它通讯方式无需赋值
	    Commport:Integer;				//串口号，只有通讯方式为2时才需赋值，其它通讯方式无需赋值
	    Baud:Integer;					//波特率，只有通讯方式为2时才需赋值，其它通讯方式无需赋值,   0.9600   1.57600   2.115200  直接赋值 9600，19200，38400，57600，115200亦可
	    LedNumber:Integer;				//LED的屏号，只有通讯方式为2时，且用485通讯时才需赋值，其它通讯方式无需赋值
	    OutputDir:Array [0..259] of Char;	//磁盘保存的目录，只有通讯方式为3时才需赋值，其它通讯方式无需赋值
    end;
    LPCOMMUNICATIONINFO=^COMMUNICATIONINFO;
//***********************************************************************

//**区域坐标结构体*********************************************************
    AREARECT = record
	    left:Integer;	//区域左上角横坐标
	    top:Integer;	//区域左上角纵坐标
	    width:Integer;	//区域的宽度
	    height:Integer;	//区域的高度
    end;
    LPAREARECT=^AREARECT;
//****************************************************************************
//***字体属性结构对**********************************************************
    FONTPROP = record
	    FontName:Array [0..31] of Char;		//字体名
	    FontSize:Integer;			//字号(单位磅)
	    FontColor:Integer;			//字体颜色
	    FontBoldP:Integer;			//是否加粗
	    FontItalic:Integer;			//是否斜体
	    FontUnderLine:Integer;		//时否下划线
    end;
    LPFONTPROP=^FONTPROP;
//****************************************************************************
//**页面显示的属性结构体****************************************************
    PLAYPROP = record
	    InStyle:Integer;	//入场特技值（取值范围 0-39）
	    OutStyle:Integer;	//退场特技值（现无效，预留，置0）
	    Speed:Integer;		//特技显示速度(取值范围1-255)
	    DelayTime:Integer;	//页面留停时间(1-65535)
    end;
    LPPLAYPROP=^PLAYPROP;
    {
      /*  特技值对应
            0=立即显示
            1=随机
            2=左移
            3=右移
            4=上移
            5=下移
            6=连续左移
            7=连续右移
            8=连续上移
            9=连续下移
            10=闪烁
            11=激光字(向上)
            12=激光字(向下)
            13=激光字(向左)
            14=激光字(向右)
            15=水平交叉拉幕
            16=上下交叉拉幕
            17=左右切入
            18=上下切入
            19=左覆盖
            20=右覆盖
            21=上覆盖
            22=下覆盖
            23=水平百叶(左右)
            24=水平百叶(右左)
            25=垂直百叶(上下)
            26=垂直百叶(下上)
            27=左右对开
            28=上下对开
            29=左右闭合
            30=上下闭合
            31=向左拉伸
            32=向右拉伸
            33=向上拉伸
            34=向下拉伸
            35=分散向左拉伸
            36=分散向右拉伸
            37=冒泡
            38=下雪
         */    }
//*******************************************************************************
//**设置节目定时属性结构体****************************************************
PROGRAMTIME = record
	EnableFlag:Integer;  //启用定时的标记，ENABLE_DATE为启用日期,ENABLE_TIME为启用时间,ENABLE_WEEK为启用星期,可用或运算进行组合，如 ENABLE_DATE | ENABLE_TIME | ENABLE_WEEK
	WeekValue:Integer;  //启用星期后，选择要定时的星期里的某些天，用宏 WEEK_MON,WEEK_TUES,WEEK_WEN,WEEK_THUR,WEEK_FRI,WEEK_SAT,WEEK_SUN 通过或运算进行组合
	StartYear:Integer;  //起始年
	StartMonth:Integer;  //起始月
	StartDay:Integer;  //起始日
	StartHour:Integer;  //起姐时
	StartMinute:Integer; //起始分
	StartSecond:Integer; //起始秒
	EndYear:Integer;  //结束年
	EndMonth:Integer;  //结束月
	EndDay:Integer;   //结束日
	EndHour:Integer;  //结束时
	EndMinute:Integer;  //结束分
	EndSecond:Integer;  //结束秒
end;
LPPROGRAMTIME=^PROGRAMTIME;
//**********************************************************************************
//数字时钟属性结构体*********************************************************************************
DIGITALCLOCKAREAINFO = record
	ShowStr:Array [0..127] of Char;   //自定义显示字符串
	ShowStrFont:FONTPROP;   //自定义显示字符串以及日期星期时间的字体属性，注意此字体属性里的FontColor只对自定义显示字体有效，其它项的颜色有单独的颜色属性，属性的赋值见FONTPROP结构体说明
	TimeLagType:Integer;   //时差类型 0为超前，1为滞后
	HourNum:Integer;    //时差小时数 
	MiniteNum:Integer;    //时差分钟数
	DateFormat:Integer;    //日期格式 0.YYYY年MM月DD日  1.YY年MM月DD日  2.MM/DD/YYYY  3.YYYY/MM/DD  4.YYYY-MM-DD  5.YYYY.MM.DD  6.MM.DD.YYYY  7.DD.MM.YYYY
	DateColor:Integer;    //日期字体颜色
	WeekFormat:Integer;    //星期格式 0.星期X  1.Monday  2.Mon.
	WeekColor:Integer;    //星期字体颜色
	TimeFormat:Integer;    //时间格式 0.HH时mm分ss秒  1.HH時mm分ss秒  2.HH:mm:ss  3.上午 HH:mm:ss  4.AM HH:mm:ss  5.HH:mm:ss 上午  6.HH:mm:ss AM
	TimeColor:Integer;    //时间字体颜色
	IsShowYear:Integer;    //是否显示年 TRUE为显示 FALSE不显示 下同
	IsShowWeek:Integer;    //是否显示星期
	IsShowMonth:Integer;   //是否显示月
	IsShowDay:Integer;    //是否显示日
	IsShowHour:Integer;    //是否显示时
	IsShowMinute:Integer;   //是否显示分
	IsShowSecond:Integer;   //是否显示秒
	IsMutleLineShow:Integer;  //是否多行显示
end;
LPDIGITALCLOCKAREAINFO=^DIGITALCLOCKAREAINFO;
//******************************************************************************
//**模拟时钟属性结构体*********************************************************
CLOCKAREAINFO = record
	ShowStr:Array [0..63] of Char;   //自定义显示字符串
	ShowStrFont:FONTPROP;   //自定义显示字符串字体属性
	TimeLagType:Integer;   //时差类型 0为超前，1为滞后
	HourNum:Integer;    //时差小时数
	MiniteNum:Integer;    //时差分钟数
	ClockType:Integer;    //表盘类型  0.圆形  1.正方形
	HourMarkColor:Integer;   //时标颜色 
	HourMarkType:Integer;   //时标类型 0.圆形  1.正方形
	HourMarkWidth:Integer;   //时标宽度 1~16
	MiniteMarkColor:Integer;  //分标颜色
	MiniteMarkType:Integer;   //分标类型 0.圆形  1.正方形
	MiniteMarkWidth:Integer;  //分标宽度  1~16
	HourPointerColor:Integer;  //时针颜色
	MinutePointerColor:Integer;  //分针颜色
	SecondPointerColor:Integer;  //秒针颜色
	HourPointerWidth:Integer;  //时针的宽度  1~5
	MinutePointerWidth:Integer;  //分针的宽度  1~5
	SecondPointerWidth:Integer;  //秒针的宽度  1~5
	IsShowDate:Integer;    //是否显示日期 
	DateFormat:Integer;    //日期格式 0.YYYY年MM月DD日  1.YY年MM月DD日  2.MM/DD/YYYY  3.YYYY/MM/DD  4.YYYY-MM-DD  5.YYYY.MM.DD  6.MM.DD.YYYY  7.DD.MM.YYYY
	DateFont:FONTPROP;    //日期字体属性
	IsShowWeek:Integer;    //是否显示星期
	WeekFormat:Integer;    //星期格式 0.星期X  1.Monday  2.Mon.
	WeekFont:FONTPROP;    //星期字体属性
end;
LPCLOCKAREAINFO=^CLOCKAREAINFO;
//**************************************************************************************
//**计时属性结构体**********************************************************************
TIMEAREAINFO = record
	ShowFormat:Integer;    //显示格式 0.xx天xx时xx分xx秒  1.xx天xx時xx分xx秒  2.xxDayxxHourxxMinxxSec  3.XXdXXhXXmXXs  4.xx:xx:xx:xx
	nYear:Integer;     //结束年
	nMonth:Integer;     //结束月
	nDay:Integer;     //结束日
	nHour:Integer;     //结束时
	nMinute:Integer;    //结束分
	nSecond:Integer;    //结束秒
	IsShowDay:Integer;    //是否显示天
	IsShowHour:Integer;    //是否显示时
	IsShowMinute:Integer;   //是否显示分
	IsShowSecond:Integer;   //是否显示秒
	IsMutleLineShow:Integer;  //是否多行显示，指的是自定义文字与计时文字是否分行显示
	ShowStr:Array [0..127] of Char;   //自定义文字字符串
	TimeStrColor:Integer;   //计时文字的颜色
	ShowFont:FONTPROP;    //自定义文字及计时文字颜色，其中FontColor只对文定义文字有效，计时文字颜色为TimeStrColor
end;
LPTIMEAREAINFO=^TIMEAREAINFO;
//****************************************************************************************
//**LED通讯参数修改结构体*****************************************************************
LEDCOMMUNICATIONPARAMETER = record
	dwMask:Integer;    //要修改项的标记  0.修改网络通讯参数  1.修改串口通讯参数  2.修改网口和串口通讯参数
	IpStr:Array [0..15] of Char;   //新的IP地址，只有dwMask为0或2时才需赋值，其它值无需赋值，格式例如 192.168.1.100
	NetMaskStr:Array [0..15] of Char;  //新的子网掩码，只有dwMask为0或2时才需赋值，其它值无需赋值，格式例如 255.255.255.0
	GatewayStr:Array [0..15] of Char;  //新的网关，只有dwMask为0或2时才需赋值，其它值无需赋值,格式例如 192.168.1.1
	MacStr:Array [0..17] of Char;   //新的MAC地址，只有dwMask为0或2时才需赋值，其它值无需赋值，格式例如 12-34-56-78-9a-bc,如无需修改请设为 ff-ff-ff-ff-ff-ff
	Baud:Integer;    //波特率，只有dwMask为1或2时才需赋值，其它值无需赋值，0.9600  1.57600  2.115200
	LedNumber:Integer;   //LED屏号 1~255,网络通讯和232通讯赋值 1 即可，485必需和控制卡显示的屏号相同才可通讯
end;
LPLEDCOMMUNICATIONPARAMETER=^LEDCOMMUNICATIONPARAMETER;

//*****************************************************************************************
//**流水边框属性结构体************************************************************************
WATERBORDERINFO = record
	Flag:Integer;       //流水边框加载类型标志，0.为动态库预置的边框  1.为从文件加载的边框
	BorderType:Integer;      //边框的类型，Flag为0是有效，0.单色边框  1.双基色边框  2.全彩边框
	BorderValue:Integer;     //边框的值，Flag为0是有效，单色边框取值范围是0~39,双基色边框取值范围是0~34,全彩边框取值范围是0~21
	BorderColor:Integer;     //边框线颜色,Flag为0并且BorderType为0是才有效
	BorderStyle:Integer;     //边框显示的样式  0.固定  1.顺时针  2.逆时针  3.闪烁
	BorderSpeed:Integer;     //边框流动的速度
	WaterBorderBmpPath:Array [0..259] of Char; //边框图片文件的路径，注意只能是bmp图片，图片大小必需是宽度为32点，取高度小于等于8
end;
LPWATERBORDERINFO=^WATERBORDERINFO;
//*********************************************************************************************
//**定时开关屏设置属性************************************************************************
ONOFFTIMEINFO = record
	TimeFlag:Array [0..2] of Integer;
	StartHour:Array [0..2] of Integer;
	StartMinute:Array [0..2] of Integer;
	EndHour:Array [0..2] of Integer;
	EndMinute:Array [0..2] of Integer;
end;
LPONOFFTIMEINFO=^ONOFFTIMEINFO;
//********************************************************************************************
//**定时亮度设置属性**************************************************************************
BRIGHTNESSTIMEINFO = record
	TimeFlag:Array [0..2] of Integer;
	StartHour:Array [0..2] of Integer;
	StartMinute:Array [0..2] of Integer;
	EndHour:Array [0..2] of Integer;
	EndMinute:Array [0..2] of Integer;
	BrightnessValue:Array [0..2] of Integer;
end;
LPBRIGHTNESSTIMEINFO=^BRIGHTNESSTIMEINFO;
//*******************************************************************************************
{/********************************************************************************************
 *	LV_CreateProgram			创建节目对象，返回类型为 HPROGRAM
 *
 *	参数说明
 *				LedWidth		屏的宽度
 *				LedHeight		屏的高度
 *				ColorType		屏的颜色 1.单色  2.双基色  3.七彩  4.全彩
 *	返回值
 *				0				创建节目对象失败
 *				非0				创建节目对象成功
 ********************************************************************************************/}
function LV_CreateProgram(LedWidth:Integer;LedHeight:Integer;ColorType:Integer):Integer;stdcall; external 'lv_led.dll';
{/*********************************************************************************************
 *	LV_AddProgram				添加一个节目
 *	
 *	参数说明
 *				hProgram		节目对象句柄
 *				ProgramNo		节目号
 *				ProgramTime		节目播放时长 0.节目播放时长  非0.指定播放时长
 *				LoopCount		循环播放次数
 *	返回值
 *				0				成功
 *				非0				失败，调用LV_GetError来获取错误信息	
 ********************************************************************************************/}
function LV_AddProgram(hProgram:Integer;ProgramNo:Integer;ProgramTime:Integer;LoopCount:Integer):Integer;stdcall; external 'lv_led.dll';

{/*********************************************************************************************
 *	LV_SetProgramTime			设置节目定时
 *
 *	参数说明
 *				hProgram		节目对象句柄
 *				ProgramNo		节目号
 *				pProgramTime	节目定时属性，设置方式见PROGRAMTIME结构体注示
 *	返回值
 *				0				成功
 *				非0				失败，调用LV_GetError来获取错误信息	
 ********************************************************************************************/}
function LV_SetProgramTime(hProgram:Integer;ProgramNo:Integer;pProgramTime:LPPROGRAMTIME):Integer;stdcall; external 'lv_led.dll';

{/*********************************************************************************************
 *	LV_AddImageTextArea				添加一个图文区域
 *	
 *	参数说明
 *				hProgram			节目对象句柄
 *				ProgramNo			节目号
 *				AreaNo				区域号
 *				pAreaRect			区域坐标属性，设置方式见AREARECT结构体注示
 *				IsBackgroundArea	是否为背景区域，0.前景区（默认） 1.背景区
 *	返回值
 *				0					成功
 *				非0					失败，调用LV_GetError来获取错误信息
 ********************************************************************************************/}
function LV_AddImageTextArea(hProgram:Integer;ProgramNo:Integer;AreaNo:Integer;pAreaRect:LPAREARECT;IsBackgroundArea:Integer):Integer;stdcall; external 'lv_led.dll';

{/*********************************************************************************************
 *	LV_AddDataToImageTextAreaFromFile	添加一个文件到图文区
 *	
 *	参数说明
 *				hProgram				节目对象句柄
 *				ProgramNo				节目号
 *				AreaNo					区域号
 *				FilePath				文件路径，支持的文件类型有 txt  rtf  bmp  gif  png  jpg jpeg tiff
 *				pPlayProp				显示的属性，设置方式见PLAYPROP结构体注示
 *	返回值
 *				0						成功
 *				非0						失败，调用LV_GetError来获取错误信息	
 ********************************************************************************************/}
function LV_AddFileToImageTextArea(hProgram:Integer;ProgramNo:Integer;AreaNo:Integer;FilePath:PChar;pPlayProp:LPPLAYPROP):Integer;stdcall; external 'lv_led.dll';

{/*********************************************************************************************
 *	LV_AddSingleLineTextToImageTextArea	添加一个单行文本到图文区
 *	
 *	参数说明
 *				hProgram				节目对象句柄
 *				ProgramNo				节目号
 *				AreaNo					区域号
 *				AddType					添加的类型  0.为字符串  1.文件（只支持txt和rtf文件）
 *				AddStr					AddType为0则为字符串数据,AddType为1则为文件路径
 *				pFontProp				如果AddType为字符串类型或AddType为文件类型且文件为txt则可传入以赋值的该结构体，其它可赋NULL
 *				pPlayProp				显示的属性，设置方式见PLAYPROP结构体注示
 *	返回值
 *				0						成功
 *				非0						失败，调用LV_GetError来获取错误信息	
 ********************************************************************************************/}
function LV_AddSingleLineTextToImageTextArea(hProgram:Integer;ProgramNo:Integer;AreaNo:Integer;AddType:Integer;AddStr:PChar;pFontProp:LPFONTPROP;pPlayProp:LPPLAYPROP):Integer;stdcall; external 'lv_led.dll';

{/*********************************************************************************************
 *	LV_AddMultiLineTextToImageTextArea	添加一个多行文本到图文区
 *	
 *	参数说明
 *				hProgram				节目对象句柄
 *				ProgramNo				节目号
 *				AreaNo					区域号
 *				AddType					添加的类型  0.为字符串  1.文件（只支持txt和rtf文件）
 *				AddStr					AddType为0则为字符串数据,AddType为1则为文件路径
 *				pFontProp				如果AddType为字符串类型或AddType为文件类型且文件为txt则可传入以赋值的该结构体，其它可赋NULL
 *				pPlayProp				显示的属性，设置方式见PLAYPROP结构体注示
 *				nAlignment				水平对齐样式，0.左对齐  1.右对齐  2.水平居中  （注意：只对字符串和txt文件有效）
 *				IsVCenter				是否垂直居中  0.置顶（默认） 1.垂直居中
 *	返回值
 *				0						成功
 *				非0						失败，调用LV_GetError来获取错误信息	
 ********************************************************************************************/}
function LV_AddMultiLineTextToImageTextArea(hProgram:Integer;ProgramNo:Integer;AreaNo:Integer;AddType:Integer;AddStr:PChar;pFontProp:LPFONTPROP;pPlayProp:LPPLAYPROP;nAlignment:Integer;IsVCenter:Integer):Integer;stdcall; external 'lv_led.dll';

{/*********************************************************************************************
 *	LV_AddStaticTextToImageTextArea		添加一个静止文本到图文区
 *	
 *	参数说明
 *				hProgram				节目对象句柄
 *				ProgramNo				节目号
 *				AreaNo					区域号
 *				AddType					添加的类型  0.为字符串  1.文件（只支持txt和rtf文件）
 *				AddStr					AddType为0则为字符串数据,AddType为1则为文件路径
 *				pFontProp				如果AddType为字符串类型或AddType为文件类型且文件为txt则可传入以赋值的该结构体，其它可赋NULL
 *				DelayTime				显示的时长 1~65535
 *				nAlignment				水平对齐样式，0.左对齐  1.右对齐  2.水平居中  （注意：只对字符串和txt文件有效）
 *				IsVCenter				是否垂直居中  0.置顶（默认） 1.垂直居中
 *	返回值
 *				0						成功
 *				非0						失败，调用LV_GetError来获取错误信息	
 ********************************************************************************************/}
function LV_AddStaticTextToImageTextArea(hProgram:Integer;ProgramNo:Integer;AreaNo:Integer;AddType:Integer;AddStr:PChar;pFontProp:LPFONTPROP;DelayTime:Integer;nAlignment:Integer;IsVCenter:Integer):Integer;stdcall; external 'lv_led.dll';


{/*********************************************************************************************
 *	LV_QuickAddSingleLineTextArea		快速添加一个单行文本区域
 *	
 *	参数说明
 *				hProgram				节目对象句柄
 *				ProgramNo				节目号
 *				AreaNo					区域号
 *				pAreaRect				区域坐标属性，设置方式见AREARECT结构体注示
 *				AddType					添加的类型  0.为字符串  1.文件（只支持txt和rtf文件）
 *				AddStr					AddType为0则为字符串数据,AddType为1则为文件路径
 *				pFontProp				如果AddType为字符串类型或AddType为文件类型且文件为txt则可传入以赋值的该结构体，其它可赋NULL
 *				nSpeed					滚动速度 1~255
 *	返回值
 *				0						成功
 *				非0						失败，调用LV_GetError来获取错误信息	
 ********************************************************************************************/}
function LV_QuickAddSingleLineTextArea(hProgram:Integer;ProgramNo:Integer;AreaNo:Integer;pAreaRect:LPAREARECT;AddType:Integer;AddStr:PChar;pFontProp:LPFONTPROP;nSpeed:Integer):Integer;stdcall; external 'lv_led.dll';


{/*********************************************************************************************
 *	LV_AddDigitalClockArea				添加一个数字时钟区域
 *	
 *	参数说明
 *				hProgram				节目对象句柄
 *				ProgramNo				节目号
 *				AreaNo					区域号
 *				pAreaRect				区域坐标属性，设置方式见AREARECT结构体注示
 *				pDigitalClockAreaInfo	数字时钟属性，见DIGITALCLOCKAREAINFO结构体注示
 *	返回值
 *				0						成功
 *				非0						失败，调用LV_GetError来获取错误信息	
 ********************************************************************************************/}
function LV_AddDigitalClockArea(hProgram:Integer;ProgramNo:Integer;AreaNo:Integer;pAreaRect:LPAREARECT;pDigitalClockAreaInfo:LPDIGITALCLOCKAREAINFO):Integer;stdcall; external 'lv_led.dll';

{/*********************************************************************************************
 *	LV_AddTimeArea						添加一个计时区域
 *	
 *	参数说明
 *				hProgram				节目对象句柄
 *				ProgramNo				节目号
 *				AreaNo					区域号
 *				pAreaRect				区域坐标属性，设置方式见AREARECT结构体注示
 *				pTimeAreaInfo			计时属性，见TIMEAREAINFO结构体注示
 *	返回值
 *				0						成功
 *				非0						失败，调用LV_GetError来获取错误信息	
 ********************************************************************************************/}
function LV_AddTimeArea(hProgram:Integer;ProgramNo:Integer;AreaNo:Integer;pAreaRect:LPAREARECT;pTimeAreaInfo:LPTIMEAREAINFO):Integer;stdcall; external 'lv_led.dll';

{/*********************************************************************************************
 *	LV_AddClockArea						添加一个模拟时钟区域
 *	
 *	参数说明
 *				hProgram				节目对象句柄
 *				ProgramNo				节目号
 *				AreaNo					区域号
 *				pAreaRect				区域坐标属性，设置方式见AREARECT结构体注示
 *				pClockAreaInfo			模拟时钟属性，见CLOCKAREAINFO结构体注示
 *	返回值
 *				0						成功
 *				非0						失败，调用LV_GetError来获取错误信息	
 ********************************************************************************************/}
function LV_AddClockArea(hProgram:Integer;ProgramNo:Integer;AreaNo:Integer;pAreaRect:LPAREARECT;pClockAreaInfo:LPCLOCKAREAINFO):Integer;stdcall; external 'lv_led.dll';

{/*********************************************************************************************
 *	LV_AddWaterBorder					添加一个流水边框区域
 *	
 *	参数说明
 *				hProgram				节目对象句柄
 *				ProgramNo				节目号
 *				AreaNo					区域号
 *				pAreaRect				区域坐标属性，设置方式见AREARECT结构体注示
 *				pWaterBorderInfo		流水边框属性，见WATERBORDERINFO结构体注示
 *	返回值
 *				0						成功
 *				非0						失败，调用LV_GetError来获取错误信息	
 ********************************************************************************************/}
function LV_AddWaterBorder(hProgram:Integer;ProgramNo:Integer;AreaNo:Integer;pAreaRect:LPAREARECT;pWaterBorderInfo:LPWATERBORDERINFO):Integer;stdcall; external 'lv_led.dll';

{/*********************************************************************************************
 *	LV_DeleteProgram					销毁节目对象(注意：如果此节目对象不再使用，请调用此函数销毁，否则会造成内存泄露)
 *	
 *	参数说明
 *				hProgram				节目对象句柄
 ********************************************************************************************/}
procedure LV_DeleteProgram(hProgram:Integer);stdcall; external 'lv_led.dll';

{/*********************************************************************************************
 *	LV_Send								发送节目，此发送为一对一发送
 *	
 *	参数说明
 *				pCommunicationInfo		通讯参数，赋值方式见COMMUNICATIONINFO结构体注示
 *				hProgram				节目对象句柄
 *	返回值
 *				0						成功
 *				非0						失败，调用LV_GetError来获取错误信息	
 ********************************************************************************************/}
function LV_Send(pCommunicationInfo:LPCOMMUNICATIONINFO;hProgram:Integer):Integer;stdcall; external 'lv_led.dll';

{/*********************************************************************************************
 *	LV_MultiSendOne						发送节目，此发送为多块屏共享一个节目对象并行发送
 *	
 *	参数说明
 *				pCommunicationInfoArray	通讯参数，为一数组，赋值方式见COMMUNICATIONINFO结构体注示
 *				hProgram				节目对象句柄
 *				pResultArray			发送返回的结果数组,函数返回后通过此值判断发送是否成功，0为成功，非0失败（调用LV_GetError来获取错误信息）	
 *				LedCount				要发送的屏的个数，即为pCommunicationInfoArray和pResultArray数组的上标数
 *	返回值
 *				0						成功
 *				非0						失败，调用LV_GetError来获取错误信息	
 ********************************************************************************************/}
function LV_MultiSendOne(pCommunicationInfoArray:LPCOMMUNICATIONINFO;hProgram:Integer;pResultArray:PInteger;LedCount:Integer):Integer;stdcall; external 'lv_led.dll';

{/*********************************************************************************************
 *	LV_MultiSend						发送节目，此发送为多块屏发送不同的节目，并行发送
 *	
 *	参数说明
 *				pCommunicationInfoArray	通讯参数，为一数组，赋值方式见COMMUNICATIONINFO结构体注示
 *				phProgramArray			节目对象句柄数组
 *				pResultArray			发送返回的结果数组,函数返回后通过此值判断发送是否成功，0为成功，非0失败（调用LV_GetError来获取错误信息）	
 *				LedCount				要发送的屏的个数，即为pCommunicationInfoArray、phProgramArray和pResultArray数组的上标数
 *	返回值
 *				0						成功
 *				非0						失败，调用LV_GetError来获取错误信息	
 ********************************************************************************************/}
function LV_MultiSend(pCommunicationInfoArray:LPCOMMUNICATIONINFO;phProgramArray:PInteger;pResultArray:PInteger;LedCount:Integer):Integer;stdcall; external 'lv_led.dll';

{/*********************************************************************************************
 *	LV_TestOnline						测试LED屏是否可连接上
 *	
 *	参数说明
 *				pCommunicationInfo		通讯参数，赋值方式见COMMUNICATIONINFO结构体注示
 *	返回值
 *				0						成功
 *				非0						失败，调用LV_GetError来获取错误信息	
 ********************************************************************************************/}
function LV_TestOnline(pCommunicationInfo:LPCOMMUNICATIONINFO):Integer;stdcall; external 'lv_led.dll';
{/*********************************************************************************************
 *	LV_SetBasicInfo						设置基本屏参
 *	
 *	参数说明
 *				pCommunicationInfo		通讯参数，赋值方式见COMMUNICATIONINFO结构体注示
 *				ColorType				屏的颜色 1.单色  2.双基色  3.七彩  4.全彩
 *				LedWidth				屏的宽度点数
 *				LedHeight				屏的高度点数
 *	返回值
 *				0						成功
 *				非0						失败，调用LV_GetError来获取错误信息	
 ********************************************************************************************/}
function LV_SetBasicInfo(pCommunicationInfo:LPCOMMUNICATIONINFO;ColorType:Integer;LedWidth:Integer;LedHeight:Integer):Integer;stdcall; external 'lv_led.dll';

{/*********************************************************************************************
 *	LV_SetOEDA							设置OE DA
 *	
 *	参数说明
 *				pCommunicationInfo		通讯参数，赋值方式见COMMUNICATIONINFO结构体注示
 *				Oe						OE  0.低有效  1.高有效
 *				Da						DA  0.负极性  1.正极性
 *	返回值
 *				0						成功
 *				非0						失败，调用LV_GetError来获取错误信息	
 ********************************************************************************************/}
function LV_SetOEDA(pCommunicationInfo:LPCOMMUNICATIONINFO;Oe:Integer;Da:Integer):Integer;stdcall; external 'lv_led.dll';

{/*********************************************************************************************
 *	LV_AdjustTime						校时
 *	
 *	参数说明
 *				pCommunicationInfo		通讯参数，赋值方式见COMMUNICATIONINFO结构体注示
 *	返回值
 *				0						成功
 *				非0						失败，调用LV_GetError来获取错误信息	
 ********************************************************************************************/}
function LV_AdjustTime(pCommunicationInfo:LPCOMMUNICATIONINFO):Integer;stdcall; external 'lv_led.dll';

{/*********************************************************************************************
 *	LV_PowerOnOff						开关屏
 *	
 *	参数说明
 *				pCommunicationInfo		通讯参数，赋值方式见COMMUNICATIONINFO结构体注示
 *				OnOff					开关值  0.关屏  1.开屏
 *	返回值
 *				0						成功
 *				非0						失败，调用LV_GetError来获取错误信息	
 ********************************************************************************************/}
function LV_PowerOnOff(pCommunicationInfo:LPCOMMUNICATIONINFO;OnOff:Integer):Integer;stdcall; external 'lv_led.dll';

{/*********************************************************************************************
 *	LV_TimePowerOnOff					定时开关屏
 *	
 *	参数说明
 *				pCommunicationInfo		通讯参数，赋值方式见COMMUNICATIONINFO结构体注示
 *				pTimeInfo				定时开关屏属性，详见ONOFFTIMEINFO结构体注示
 *	返回值
 *				0						成功
 *				非0						失败，调用LV_GetError来获取错误信息	
 ********************************************************************************************/}
function LV_TimePowerOnOff(pCommunicationInfo:LPCOMMUNICATIONINFO;pTimeInfo:LPONOFFTIMEINFO):Integer;stdcall; external 'lv_led.dll';

{/*********************************************************************************************
 *	LV_SetBrightness					设置亮度
 *	
 *	参数说明
 *				pCommunicationInfo		通讯参数，赋值方式见COMMUNICATIONINFO结构体注示
 *				BrightnessValue			亮度值 0~15
 *	返回值
 *				0						成功
 *				非0						失败，调用LV_GetError来获取错误信息	
 ********************************************************************************************/}
function LV_SetBrightness(pCommunicationInfo:LPCOMMUNICATIONINFO;BrightnessValue:Integer):Integer;stdcall; external 'lv_led.dll';
{/*********************************************************************************************
 *	LV_TimeBrightness					定时亮度
 *	
 *	参数说明
 *				pCommunicationInfo		通讯参数，赋值方式见COMMUNICATIONINFO结构体注示
 *				pBrightnessTimeInfo		定时亮度属性，详见BRIGHTNESSTIMEINFO结构体注示
 *	返回值
 *				0						成功
 *				非0						失败，调用LV_GetError来获取错误信息	
 ********************************************************************************************/}
function LV_TimeBrightness(pCommunicationInfo:LPCOMMUNICATIONINFO;pBrightnessTimeInfo:LPBRIGHTNESSTIMEINFO):Integer;stdcall; external 'lv_led.dll';

{/*********************************************************************************************
 *	LV_SetLanguage						设置LED显示的语言
 *	
 *	参数说明
 *				pCommunicationInfo		通讯参数，赋值方式见COMMUNICATIONINFO结构体注示
 *				LanguageValue			语言值  0.中文（默认） 1.英文
 *	返回值
 *				0						成功
 *				非0						失败，调用LV_GetError来获取错误信息	
 ********************************************************************************************/}
function LV_SetLanguage(pCommunicationInfo:LPCOMMUNICATIONINFO;LanguageValue:Integer):Integer;stdcall; external 'lv_led.dll';
{/*********************************************************************************************
 *	LV_LedTest							LED测试
 *
 *	参数说明
 *				pCommunicationInfo		通讯参数，赋值方式见COMMUNICATIONINFO结构体注示
 *				TestValue				测试值
 *	返回值
 *				0						成功
 *				非0						失败，调用LV_GetError来获取错误信息	
 ********************************************************************************************/}
function LV_LedTest(pCommunicationInfo:LPCOMMUNICATIONINFO;TestValue:Integer):Integer;stdcall; external 'lv_led.dll';

{/*********************************************************************************************
 *	LV_TimeLocker						LED定时锁屏
 *	
 *	参数说明
 *				pCommunicationInfo		通讯参数，赋值方式见COMMUNICATIONINFO结构体注示
 *				LockerYear				锁屏年
 *				LockerMonth				锁屏月
 *				LockerDay				锁屏日
 *				LockerHour				锁屏时
 *				LockerMinute			锁屏分
 *	返回值
 *				0						成功
 *				非0						失败，调用LV_GetError来获取错误信息	
 ********************************************************************************************/}
function LV_TimeLocker(pCommunicationInfo:LPCOMMUNICATIONINFO;LockerYear:Integer;LockerMonth:Integer;LockerDay:Integer;LockerHour:Integer;LockerMinute:Integer):Integer;stdcall; external 'lv_led.dll';

{/*********************************************************************************************
 *	LV_CancelLocker						取消定时锁屏
 *	
 *	参数说明
 *				pCommunicationInfo		通讯参数，赋值方式见COMMUNICATIONINFO结构体注示
 *	返回值
 *				0						成功
 *				非0						失败，调用LV_GetError来获取错误信息	
 ********************************************************************************************/}
function LV_CancelLocker(pCommunicationInfo:LPCOMMUNICATIONINFO):Integer;stdcall; external 'lv_led.dll';

{/*********************************************************************************************
 *	LV_SetLedCommunicationParameter			设置LED通讯参数
 *	
 *	参数说明
 *				pCommunicationInfo			通讯参数，赋值方式见COMMUNICATIONINFO结构体注示
 *				pLedCommunicationParameter	详见LEDCOMMUNICATIONPARAMETER结构体注示
 *	返回值
 *				0						成功
 *				非0						失败，调用LV_GetError来获取错误信息	
 ********************************************************************************************/}
function LV_SetLedCommunicationParameter(pCommunicationInfo:LPCOMMUNICATIONINFO;pLedCommunicationParameter:LPLEDCOMMUNICATIONPARAMETER):Integer;stdcall; external 'lv_led.dll';

{/*********************************************************************************************
 *	LV_GetError								获取错误信息（只支持中文）
 *	
 *	参数说明
 *				nErrCode					函数执行返回的错误代码
 *				nMaxCount					pErrStr字符串缓冲区的大小（为字符的个数，非字节数）
 *				pErrStr						待获取错误信息的字符串地址
 ********************************************************************************************/}
function LV_GetError(nErrCode:Integer;nMaxCount:Integer;pErrStr:PChar):Integer;stdcall; external 'lv_led.dll';


implementation

end.
