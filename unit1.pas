unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    CmbSearchSort: TComboBox;
    Memo1: TMemo;
    Panel1: TPanel;
    procedure CmbSearchSortChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Panel1Click(Sender: TObject);
  private
    pnlButtons:array [0..120] of TPanel;

  type

    { TElement }

    TElement = class
       private
            AtomicNumber:string;
            ElementName:string;
            ElementSymbol:string;
            ElementMass:string;
            ElementType:string;
            Discoverer:string;
            YearDiscovered:string;

  public
   function NumNeutrons(Atomic_Number, AtomicMass:string):string;

  end;  //TElement Class


  function extractAtomicNum(stmp:string):string;
  procedure loadData;
  //function stripdoublequote(stmp:string):string;
  function getYearDiscovered(Text1:string):string; //new
  procedure showElement(i:integer); //new
 //https://forum.lazarus.freepascal.org/index.php?topic=45173.0

public
    { Public declarations }
    Elements:array[0..120] of Tform1.TElement;
    procedure sortByName; //added this Dec 2nd
    procedure sortBySymbol;

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
var i:integer;
const pnlSize =80;

begin
memo1.Font.Size:=11;
memo1.ScrollBars:=ssVertical;
loadData;
i := 0; //dummy button for index 0
pnlbuttons[i] :=tPanel.Create(form1);
//https://stackoverflow.com/questions/42490629/array-of-tpanel-in-delphi-not-show
//pnlbuttons[i].ParentBackground := false;
pnlbuttons[i].Parent:=panel1;
pnlbuttons[i].OnClick:= @panel1click;  //need @ in front for Lazarus   https://forum.lazarus.freepascal.org/index.php?topic=45173.0
pnlbuttons[i].Height:=pnlsize; pnlbuttons[i].width:=pnlsize;
pnlbuttons[i].top := 60;
pnlbuttons[i].left := 50;
pnlbuttons[i].Caption:= '  1 H';


i:=1;
//Hydrogen
  pnlbuttons[i] :=tPanel.Create(self);
  //https://stackoverflow.com/questions/42490629/array-of-tpanel-in-delphi-not-show
  pnlbuttons[i].ParentBackground := false;
  pnlbuttons[i].Parent:=self;
  pnlbuttons[i].OnClick:= @panel1click;
  pnlbuttons[i].height:= pnlsize; pnlbuttons[i].width:=pnlsize;
  pnlbuttons[i].top := pnlsize;
  pnlbuttons[i].left := 50;
  pnlbuttons[i].Caption:= inttostr(i)+' '+elements[i].ElementSymbol;
  pnlbuttons[i].color := $003ff4a4;

i:=2;
//Helium
pnlbuttons[i] :=tPanel.Create(self);
  //https://stackoverflow.com/questions/42490629/array-of-tpanel-in-delphi-not-show
  pnlbuttons[i].ParentBackground := false;
  pnlbuttons[i].Parent:=self;
  pnlbuttons[i].OnClick:= @panel1click;
  pnlbuttons[i].height:=pnlsize; pnlbuttons[i].width:=pnlsize;
  pnlbuttons[i].top := pnlsize;
  pnlbuttons[i].left :=50+17*pnlsize;
  pnlbuttons[i].Caption:= inttostr(i)+' '+elements[i].ElementSymbol;
  pnlbuttons[i].color := $00E5bde5; //BGR E5bde5 for noble gas RGB #E5BDE5

//*****************Row 2 below ********************************
I:=3;//Li
pnlbuttons[i] :=tPanel.Create(self);
pnlbuttons[i].ParentBackground := false;
pnlbuttons[i].Parent:=self;
pnlbuttons[i].OnClick:= @panel1click;
pnlbuttons[i].height:=pnlsize; pnlbuttons[i].width:=pnlsize;
pnlbuttons[i].top := (2)*pnlsize; //row2
pnlbuttons[i].left :=50;
pnlbuttons[i].Caption:= inttostr(i)+' '+elements[i].ElementSymbol;
//pnlbuttons[i].color := $003ff4a4;
pnlbuttons[i].color := $001fbbf1;

I:=4;//be
pnlbuttons[i] :=tPanel.Create(self);
pnlbuttons[i].ParentBackground := false;
pnlbuttons[i].Parent:=self;
pnlbuttons[i].OnClick:= @panel1click;
pnlbuttons[i].height:=pnlsize; pnlbuttons[i].width:=pnlsize;
pnlbuttons[i].top := (2)*pnlsize;
pnlbuttons[i].left :=50+1*pnlsize;
pnlbuttons[i].Caption:= inttostr(i)+' '+elements[i].ElementSymbol;
//pnlbuttons[i].color := $003ff4a4;
pnlbuttons[i].color := $0063f9fb;

I:=5;//B
pnlbuttons[i] :=tPanel.Create(self);
pnlbuttons[i].ParentBackground := false;
pnlbuttons[i].Parent:=self;
pnlbuttons[i].OnClick:= @panel1click;
pnlbuttons[i].height:=pnlsize; pnlbuttons[i].width:=pnlsize;
pnlbuttons[i].top := (2)*pnlsize;
pnlbuttons[i].left :=50+12*pnlsize;
pnlbuttons[i].Caption:= inttostr(i)+' '+elements[i].ElementSymbol;
pnlbuttons[i].color := $00ffda00;


I:=6;//C
pnlbuttons[i] :=tPanel.Create(self);
pnlbuttons[i].ParentBackground := false;
pnlbuttons[i].Parent:=self;
pnlbuttons[i].OnClick:= @panel1click;
pnlbuttons[i].height:=pnlsize; pnlbuttons[i].width:=pnlsize;
pnlbuttons[i].top := (2)*pnlsize;
pnlbuttons[i].left :=50+13*pnlsize;
pnlbuttons[i].Caption:=inttostr(i)+' '+elements[i].ElementSymbol;
pnlbuttons[i].color := $003ff4a4;

I:=7;//N
pnlbuttons[i] :=tPanel.Create(self);
pnlbuttons[i].ParentBackground := false;
pnlbuttons[i].Parent:=self;
pnlbuttons[i].OnClick:= @panel1click;
pnlbuttons[i].height:=pnlsize; pnlbuttons[i].width:=pnlsize;
pnlbuttons[i].top := (2)*pnlsize;
pnlbuttons[i].left :=50+14*pnlsize;
pnlbuttons[i].Caption:= inttostr(i)+' '+elements[i].ElementSymbol;
pnlbuttons[i].color := $003ff4a4;

I:=8;//O
pnlbuttons[i] :=tPanel.Create(self);
pnlbuttons[i].ParentBackground := false;
pnlbuttons[i].Parent:=self;
pnlbuttons[i].OnClick:= @panel1click;
pnlbuttons[i].height:=pnlsize; pnlbuttons[i].width:=pnlsize;
pnlbuttons[i].top := (2)*pnlsize;
pnlbuttons[i].left :=50+15*pnlsize;
pnlbuttons[i].Caption:= inttostr(i)+' '+elements[i].ElementSymbol;
pnlbuttons[i].color := $003ff4a4;

I:=9;//F
pnlbuttons[i] :=tPanel.Create(self);
pnlbuttons[i].ParentBackground := false;
pnlbuttons[i].Parent:=self;
pnlbuttons[i].OnClick:= @panel1click;
pnlbuttons[i].height:=pnlsize; pnlbuttons[i].width:=pnlsize;
pnlbuttons[i].top := (2)*pnlsize;
pnlbuttons[i].left :=50+16*pnlsize;
pnlbuttons[i].Caption:= inttostr(i)+' '+elements[i].ElementSymbol;
pnlbuttons[i].color := $003ff4a4;

I:=10;//Ne
pnlbuttons[i] :=tPanel.Create(self);
pnlbuttons[i].ParentBackground := false;
pnlbuttons[i].Parent:=self;
pnlbuttons[i].OnClick:= @panel1click;
pnlbuttons[i].height:=pnlsize; pnlbuttons[i].width:=pnlsize;
pnlbuttons[i].top := (2)*pnlsize;
pnlbuttons[i].left :=50+17*pnlsize;
pnlbuttons[i].Caption:= inttostr(i)+' '+elements[i].ElementSymbol;
pnlbuttons[i].color := $00E5bde5; //BGR E5bde5 for noble gas RGB #E5BDE5
//**************** Row 3 Below *********************//
I:=11;//Na
pnlbuttons[i] :=tPanel.Create(self);
pnlbuttons[i].ParentBackground := false;
pnlbuttons[i].Parent:=self;
pnlbuttons[i].OnClick:= @panel1click;
pnlbuttons[i].height:=pnlsize; pnlbuttons[i].width:=pnlsize;
pnlbuttons[i].top := (3)*pnlsize; //row3
pnlbuttons[i].left :=50;
pnlbuttons[i].Caption:= inttostr(i)+' '+elements[i].ElementSymbol;
//pnlbuttons[i].color := $003ff4a4;
pnlbuttons[i].color := $001fbbf1;

I:=12;//Mg
pnlbuttons[i] :=tPanel.Create(self);
pnlbuttons[i].ParentBackground := false;
pnlbuttons[i].Parent:=self;
pnlbuttons[i].OnClick:= @panel1click;
pnlbuttons[i].height:=pnlsize; pnlbuttons[i].width:=pnlsize;
pnlbuttons[i].top := (3)*pnlsize;
pnlbuttons[i].left :=50+1*pnlsize;
pnlbuttons[i].Caption:= inttostr(i)+' '+elements[i].ElementSymbol;
//pnlbuttons[i].color := $003ff4a4;
pnlbuttons[i].color := $0063f9fb;

I:=13;//Al
pnlbuttons[i] :=tPanel.Create(self);
pnlbuttons[i].ParentBackground := false;
pnlbuttons[i].Parent:=self;
pnlbuttons[i].OnClick:= @panel1click;
pnlbuttons[i].height:=pnlsize; pnlbuttons[i].width:=pnlsize;
pnlbuttons[i].top := (3)*pnlsize;
pnlbuttons[i].left :=50+12*pnlsize;
pnlbuttons[i].Caption:= inttostr(i)+' '+elements[i].ElementSymbol;
pnlbuttons[i].color := $00fffc85;


I:=14;//Si
pnlbuttons[i] :=tPanel.Create(self);
pnlbuttons[i].ParentBackground := false;
pnlbuttons[i].Parent:=self;
pnlbuttons[i].OnClick:= @panel1click;
pnlbuttons[i].height:=pnlsize; pnlbuttons[i].width:=pnlsize;
pnlbuttons[i].top := (3)*pnlsize;
pnlbuttons[i].left :=50+13*pnlsize;
pnlbuttons[i].Caption:= inttostr(i)+' '+elements[i].ElementSymbol;
pnlbuttons[i].color :=  $00ffda00;

I:=15;//P
pnlbuttons[i] :=tPanel.Create(self);
pnlbuttons[i].ParentBackground := false;
pnlbuttons[i].Parent:=self;
pnlbuttons[i].OnClick:= @panel1click;
pnlbuttons[i].height:=pnlsize; pnlbuttons[i].width:=pnlsize;
pnlbuttons[i].top := (3)*pnlsize;
pnlbuttons[i].left :=50+14*pnlsize;
pnlbuttons[i].Caption:= inttostr(i)+' '+elements[i].ElementSymbol;
pnlbuttons[i].color := $003ff4a4;

I:=16;//O
pnlbuttons[i] :=tPanel.Create(self);
pnlbuttons[i].ParentBackground := false;
pnlbuttons[i].Parent:=self;
pnlbuttons[i].OnClick:= @panel1click;
pnlbuttons[i].height:=pnlsize; pnlbuttons[i].width:=pnlsize;
pnlbuttons[i].top := (3)*pnlsize;
pnlbuttons[i].left :=50+15*pnlsize;
pnlbuttons[i].Caption:= inttostr(i)+' '+elements[i].ElementSymbol;
pnlbuttons[i].color := $003ff4a4;

I:=17;//Cl
pnlbuttons[i] :=tPanel.Create(self);
pnlbuttons[i].ParentBackground := false;
pnlbuttons[i].Parent:=self;
pnlbuttons[i].OnClick:= @panel1click;
pnlbuttons[i].height:=pnlsize; pnlbuttons[i].width:=pnlsize;
pnlbuttons[i].top := (3)*pnlsize;
pnlbuttons[i].left :=50+16*pnlsize;
pnlbuttons[i].Caption:= inttostr(i)+' '+elements[i].ElementSymbol;
pnlbuttons[i].color := $003ff4a4;

I:=18;//Ar
pnlbuttons[i] :=tPanel.Create(self);
pnlbuttons[i].ParentBackground := false;
pnlbuttons[i].Parent:=self;
pnlbuttons[i].OnClick:= @panel1click;
pnlbuttons[i].height:=pnlsize; pnlbuttons[i].width:=pnlsize;
pnlbuttons[i].top := (3)*pnlsize;
pnlbuttons[i].left :=50+17*pnlsize;
pnlbuttons[i].Caption:= inttostr(i)+' '+elements[i].ElementSymbol;
pnlbuttons[i].color := $00E5bde5; //BGR E5bde5 for noble gas RGB #E5BDE5

//************* Row 4 #19-36
for i := 19 to 36 do
  begin
     pnlbuttons[i] :=tPanel.Create(self);
     pnlbuttons[i].ParentBackground := false;
     pnlbuttons[i].Parent:=self;
     pnlbuttons[i].OnClick:= @panel1click;
     pnlbuttons[i].height:=pnlsize; pnlbuttons[i].width:=pnlsize;
     pnlbuttons[i].top := (4)*pnlsize; //row4
     pnlbuttons[i].left := 50 + pnlsize*(i-19);
     pnlbuttons[i].Caption:= inttostr(i)+' '+elements[i].ElementSymbol; //+#13+elements[i].ElementSymbol;  //to get symbol once load data done
     if (i>20) and (i<31) then //Transitional Metals
        pnlbuttons[i].color := $00bcbcf0    //F0BCBC
     else if (i>31) and (i<34) then
        pnlbuttons[i].color :=  $00ffda00
     else if i=31 then
        pnlbuttons[i].color := $00fffc85 //BGR E5bde5 for noble gas RGB #E5BDE5
     else if i=36 then
        pnlbuttons[i].color := $00E5bde5
     else if i=19 then
        pnlbuttons[i].color := $001fbbf1
     else if i=20 then
        pnlbuttons[i].color := $0063f9fb
     else
        pnlbuttons[i].color := $003ff4a4;

  end;

//************* Row 5 #37-54
for i := 37 to 54 do
  begin
     pnlbuttons[i] :=tPanel.Create(self);
     pnlbuttons[i].ParentBackground := false;
     pnlbuttons[i].Parent:=self;
     pnlbuttons[i].OnClick:= @panel1click;
     pnlbuttons[i].height:=pnlsize; pnlbuttons[i].width:=pnlsize;
     pnlbuttons[i].top := (5)*pnlsize; //row
     pnlbuttons[i].left := 50 + pnlsize*(i-37);
     pnlbuttons[i].Caption:= inttostr(i)+' '+elements[i].ElementSymbol; //+#13+elements[i].ElementSymbol;  //to get symbol once load data done
     if (i>38) and (i<49) then //Transitional Metals
        pnlbuttons[i].color := $00bcbcf0    //F0BCBC
     else if i=54 then
        pnlbuttons[i].color := $00E5bde5 //BGR E5bde5 for noble gas RGB #E5BDE5
     else if i=37 then
        pnlbuttons[i].color := $001fbbf1
     else if i=38 then
        pnlbuttons[i].color := $0063f9fb
     else if (i>48) and (i<51) then
        pnlbuttons[i].color := $00fffc85
     else if (i>50) and (i<53) then
        pnlbuttons[i].color :=  $00ffda00
     else
        pnlbuttons[i].color := $003ff4a4;
  end;

//*************Row 6 55-56
for i := 55 to 56 do
  begin
     pnlbuttons[i] :=tPanel.Create(self);
     pnlbuttons[i].ParentBackground := false;
     pnlbuttons[i].Parent:=self;
     pnlbuttons[i].OnClick:= @panel1click;
     pnlbuttons[i].height:=pnlsize; pnlbuttons[i].width:=pnlsize;
     pnlbuttons[i].top := (6)*pnlsize; //row
     pnlbuttons[i].left := 50 + pnlsize*(i-55);
     pnlbuttons[i].Caption:= inttostr(i)+' '+elements[i].ElementSymbol; //+#13+elements[i].ElementSymbol;  //to get symbol once load data done
     if i=55 then
        pnlbuttons[i].color := $001fbbf1
     else
        pnlbuttons[i].color := $0063f9fb;
     end;

// Row 6 57 - 71
pnlbuttons[i] :=tPanel.Create(self);
pnlbuttons[i].ParentBackground := false;
pnlbuttons[i].Parent:=self;
pnlbuttons[i].OnClick:= @panel1click;
pnlbuttons[i].height:=pnlsize; pnlbuttons[i].width:=pnlsize;
pnlbuttons[i].top := (6)*pnlsize;
pnlbuttons[i].left :=50+2*pnlsize;
pnlbuttons[i].Caption:= '57-71';
pnlbuttons[i].color := $00f2f2f2;

//*************Row 6 72-86
for i := 72 to 86 do
  begin
     pnlbuttons[i] :=tPanel.Create(self);
     pnlbuttons[i].ParentBackground := false;
     pnlbuttons[i].Parent:=self;
     pnlbuttons[i].OnClick:= @panel1click;
     pnlbuttons[i].height:=pnlsize; pnlbuttons[i].width:=pnlsize;
     pnlbuttons[i].top := (6)*pnlsize; //row
     pnlbuttons[i].left := 50 + pnlsize*(i-69);
     pnlbuttons[i].Caption:= inttostr(i)+' '+elements[i].ElementSymbol; //+#13+elements[i].ElementSymbol;  //to get symbol once load data done
       if (i>71) and (i<81) then //Transitional Metals
        pnlbuttons[i].color := $00bcbcf0    //F0BCBC
     else if i=54 then
        pnlbuttons[i].color := $00E5bde5 //BGR E5bde5 for noble gas RGB #E5BDE5
     else if (i>80) and (i<85) then
        pnlbuttons[i].color := $00fffc85
     else if i=85 then
        pnlbuttons[i].color :=  $00ffda00
     else if i=86 then
        pnlbuttons[i].color := $00E5bde5
     end;

//*** Row 7 87-88
for i := 87 to 88 do
  begin
     pnlbuttons[i] :=tPanel.Create(self);
     pnlbuttons[i].ParentBackground := false;
     pnlbuttons[i].Parent:=self;
     pnlbuttons[i].OnClick:= @panel1click;
     pnlbuttons[i].height:=pnlsize; pnlbuttons[i].width:=pnlsize;
     pnlbuttons[i].top := (7)*pnlsize; //row7
     pnlbuttons[i].left :=50 + pnlsize*(i-87);
     pnlbuttons[i].Caption:= inttostr(i)+' '+elements[i].ElementSymbol;   //to get symbol once load data done
     if i= 87 then
         pnlbuttons[i].color := $001fbbf1  //RGB f1bb1f Col 1
     else
        pnlbuttons[i].color := $0063f9fb; //RGB fbf963 Col 2
  end;

// Row 7 89 - 103
pnlbuttons[i] :=tPanel.Create(self);
pnlbuttons[i].ParentBackground := false;
pnlbuttons[i].Parent:=self;
pnlbuttons[i].OnClick:= @panel1click;
pnlbuttons[i].height:=pnlsize; pnlbuttons[i].width:=pnlsize;
pnlbuttons[i].top := (7)*pnlsize;
pnlbuttons[i].left :=50+2*pnlsize;
pnlbuttons[i].Caption:= '89-103';
pnlbuttons[i].color := $00f2f2f2;

//*************Row 7 104-118
for i := 104 to 118 do
  begin
     pnlbuttons[i] :=tPanel.Create(self);
     pnlbuttons[i].ParentBackground := false;
     pnlbuttons[i].Parent:=self;
     pnlbuttons[i].OnClick:= @panel1click;
     pnlbuttons[i].height:=pnlsize; pnlbuttons[i].width:=pnlsize;
     pnlbuttons[i].top := (7)*pnlsize; //row
     pnlbuttons[i].left := 50 + pnlsize*(i-101);
     pnlbuttons[i].Caption:= inttostr(i)+' '+elements[i].ElementSymbol; //+#13+elements[i].ElementSymbol;  //to get symbol once load data done
     if (i>103) and (i<109) then //Transitional Metals
        pnlbuttons[i].color := $00bcbcf0    //F0BCBC
     else
        pnlbuttons[i].color := $00f2f2f2;
     end;

for i := 57 to 71 do
  begin
     pnlbuttons[i] :=tPanel.Create(self);
     pnlbuttons[i].ParentBackground := false;
     pnlbuttons[i].Parent:=self;
     pnlbuttons[i].OnClick:= @panel1click;
     pnlbuttons[i].height:=pnlsize; pnlbuttons[i].width:=pnlsize;
     pnlbuttons[i].top := (9)*pnlsize; //row
     pnlbuttons[i].left := 50 + pnlsize*(i-54);
     pnlbuttons[i].Caption:= inttostr(i)+' '+elements[i].ElementSymbol; //+#13+elements[i].ElementSymbol;  //to get symbol once load data done
     pnlbuttons[i].color := $0098b0e6;
  end;

for i := 89 to 103 do
  begin
     pnlbuttons[i] :=tPanel.Create(self);
     pnlbuttons[i].ParentBackground := false;
     pnlbuttons[i].Parent:=self;
     pnlbuttons[i].OnClick:= @panel1click;
     pnlbuttons[i].height:=pnlsize; pnlbuttons[i].width:=pnlsize;
     pnlbuttons[i].top := (10)*pnlsize; //row
     pnlbuttons[i].left := 50 + pnlsize*(i-86);
     pnlbuttons[i].Caption:= inttostr(i)+' '+elements[i].ElementSymbol; //+#13+elements[i].ElementSymbol;  //to get symbol once load data done
     pnlbuttons[i].color := $00d5d5f6;
end;

end;

procedure TForm1.CmbSearchSortChange(Sender: TObject);
var i:integer; sName, sSymbol:string;
begin
  if cmbSearchSort.ItemIndex=0  then //Search Name
    begin
       sName :=inputbox('Enter Name', 'Enter Name', '');
       for i := 1 to 118 do
         begin
            //if sName = current name in array, display results
            if uppercase(sName) = uppercase(Elements[i].ElementName) then
              begin
                 //Dec 2nd to replace multiple lines commented out
                 showelement(i);
                 {
                 memo1.Lines.Add('Atomic #: '+elements[i].AtomicNumber);
                 memo1.Lines.Add('Name: '+elements[i].ElementName);
                 memo1.Lines.Add('Symbol: '+elements[i].ElementSymbol);
                 memo1.Lines.Add('Mass: '+elements[i].ElementMass);
                 memo1.Lines.Add('# Neutrons: '+
                 elements[i].NumNeutrons(elements[i].AtomicNumber,elements[i].ElementMass));
                 memo1.Lines.Add('Type: ' + elements[i].ElementType);
                 memo1.Lines.Add('Discovered by: '+elements[i].Discoverer);
                 }
              end;
         end;
    end
  else if cmbSearchSort.ItemIndex=1 then //Search symbol
    begin
       sSymbol:=inputbox('Enter Symbol', 'Enter Symbol', '');
       for i := 1 to 118 do
         begin
            if sSymbol = uppercase(Elements[i].ElementSymbol) then
              begin
                 showelement(i);
              end;
         end;
    end
  else if cmbSearchSort.ItemIndex=2  then //Sort by name
    begin
        form1.sortByName;
    end
  else if cmbSearchSort.ItemIndex=3  then //Sort by symbol
    begin
        form1.sortBySymbol;
    end; //if

end;

procedure TForm1.sortByName();
var elements1:array[0..120] of Tform1.TElement;
    tmpElement: TElement;
    i,j:integer;
begin
    memo1.Clear;
  for i := 1 to 118 do//index 0 has garbage, so ignore
    begin
          elements1[i] := form1.Elements[i];
    end;//for
  //sort by bubble sort
  for i  := 1 to 117  do
     begin
         for j := 1 to 117 do
           begin
              if elements1[j].ElementName>elements1[j+1].ElementName then
                begin //swap the two
                    tmpElement:=elements1[j];
                    elements1[j] := elements1[j+1];
                    elements1[j+1] :=tmpElement;
                end;
           end;//for j
     end;//for i
   //display sorted elements
   for i := 1 to 118 do
     begin
       form1.Memo1.Lines.Add(elements1[i].AtomicNumber+#9+elements1[i].ElementName);
     end;
end;

procedure TForm1.sortBySymbol();
var elements1:array[0..120] of Tform1.TElement;
    tmpElement: TElement;
    i,j:integer;
begin
  memo1.Clear;
  for i := 1 to 118 do //index 0 has garbage, so ignore
    begin
          elements1[i] := form1.Elements[i];
    end; //for
  //sort by bubble sort
  for i  := 1 to 117  do
     begin
         for j := 1 to 117 do
           begin
              if elements1[j].ElementSymbol>elements1[j+1].ElementSymbol then
                begin //swap the two
                    tmpElement:=elements1[j];
                    elements1[j] := elements1[j+1];
                    elements1[j+1] :=tmpElement;
                end;
           end;//for j
     end;//for i
   //display sorted elements
   for i := 1 to 118 do
     begin
       form1.Memo1.Lines.Add(elements1[i].AtomicNumber+#9+elements1[i].ElementSymbol+#9+elements1[i].ElementName);
     end;
end;

procedure TForm1.Panel1Click(Sender: TObject);
var i :integer;
    pnlCaption :string;

begin
   memo1.Clear;
   pnlCaption :=(sender as tPanel).Caption;
//https://www.tek-tips.com/viewthread.cfm?qid=81433
   //memo1.Lines.Add('You clicked ' + pnlCaption);
   i:=  strtoint(extractAtomicNum(pnlcaption));
   //   i:=strtoint(leftstr(pnlcaption,3));
   //owmessage(i.ToString);
   showElement(i);

end;

function TForm1.extractAtomicNum(stmp: string): string;
var sANum:string; i:integer;

begin
 sAnum:='';
  for I := 0 to stmp.Length do
  begin
    if stmp[i] in ['0'..'9'] then
       sAnum:= sAnum+stmp[i];
  end;
  result:=sAnum;
end;

procedure TForm1.loadData;
var RecList:Tstringlist;//array  that stores a line of data
    csvFile:textfile; //textfile variable
    s:string; //string to store a line of data
    i:integer;
begin
  assignfile(csvFile,'dataold.csv'); //connect the file variable to the textfile
  reset(csvFile);
  RecList := TStringList.Create;
  i:=0;
  try
    while not EOF(CsvFile) do
       begin
         Readln(CsvFile, S); //read in each line as a string
         // memo1.Lines.Add(s);
         Reclist.StrictDelimiter := True;
         RecList.Delimiter := ',';
         RecList.DelimitedText := S; //split the string into its fields
         elements[i] :=TElement.Create;
         //memo1.Lines.Add(RecList);
         elements[i].AtomicNumber:=reclist[0];
         elements[i].ElementName:=reclist[1];
         elements[i].ElementSymbol:=reclist[2];
         elements[i].ElementMass:=reclist[3];
         elements[i].ElementType:=reclist[4];
         //elements[i].Discoverer:=reclist[5];
         //elements[i].YearDiscovered:=reclist[6];
         elements[i].YearDiscovered:= reclist[6];
         memo1.Font.Size := 10;
         memo1.Lines.Add(elements[i].AtomicNumber + #9 + elements[i].ElementSymbol + #9 + elements[i].ElementName);
         // Now you have each field in a separate string
         // in the StringList.
		     i:=i+1;
       end;
  finally
     RecList.Free;
  end;   //Try

  closefile(csvFile);
  assignfile(csvFile,'dataDiscovery.csv'); //connect the file variable to the textfile
  reset(csvFile);
    i:=0;
    while not EOF(CsvFile) do
       begin
         Readln(CsvFile, S); //read in each line as a string
         elements[i].Discoverer:=S;
         i:=i+1;
       end;
  closefile(csvFile);

end;    //loadData

function TForm1.getYearDiscovered(Text1: string): string;
var
i:integer;
year:string;

begin
 year := '';
  for i := 1 to Text1.Length do
  begin
    if Text[i] in ['0' .. '9'] then
      year := year + Text[i];
  end;
  result := year;

end;

procedure TForm1.showElement(i: integer);
begin
  memo1.Lines.Clear;
  memo1.Lines.Add('Atomic #: '+elements[i].AtomicNumber);
  memo1.Lines.Add('Name: '+elements[i].ElementName);
  memo1.Lines.Add('Symbol: '+elements[i].ElementSymbol);
  memo1.Lines.Add('Mass: '+elements[i].ElementMass);
  memo1.Lines.Add('# Neutrons: '+elements[i].NumNeutrons(elements[i].AtomicNumber,elements[i].ElementMass));
  if elements[i].ElementType = '' then elements[i].ElementType := 'MISSING DATA';
  memo1.Lines.Add('Type: ' + elements[i].ElementType);
  if elements[i].Discoverer = '' then elements[i].Discoverer := 'MISSING DATA';
  memo1.Lines.Add('Discovered by: '+ elements[i].Discoverer);
  if elements[i].YearDiscovered = '' then elements[i].YearDiscovered := 'Unknown';
  memo1.Lines.Add('Year Discovered: '+elements[i].YearDiscovered);

end;

function TForm1.TElement.NumNeutrons(Atomic_Number, AtomicMass: string): string;
var rAtomicNum, rAtomicMass:real;
iNumNeutrons : integer;
begin //calculate neutrons
rAtomicNum :=strtofloat(AtomicNumber);
rAtomicMass := strtofloat(atomicMass);
inumNeutrons := round(rAtomicMass-rAtomicNum);
result :=iNumNeutrons.ToString;
end;


end. //program

