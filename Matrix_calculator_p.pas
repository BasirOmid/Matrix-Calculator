unit Matrix_calculator_p;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.TabControl, FMX.Layouts,
  FMX.Edit,
  FMX.ListBox, FMX.Memo.Types, FMX.ScrollBox, FMX.Memo;

type
  TForm3 = class(TForm)
    TabControl1: TTabControl;
    TabItem1: TTabItem;
    TabItem2: TTabItem;
    TabItem3: TTabItem;
    TabItem4: TTabItem;
    TabItem5: TTabItem;
    TabItem6: TTabItem;
    TabItem7: TTabItem;
    Panel1: TPanel;
    Label1: TLabel;
    GridPanelLayout1: TGridPanelLayout;
    Edit2A1: TEdit;
    Edit2A2: TEdit;
    Edit2A3: TEdit;
    Edit2A4: TEdit;
    btnCalculate2A: TButton;
    ComboBox1: TComboBox;
    Label2: TLabel;
    Memo1: TMemo;
    lbSolution2: TLabel;
    btnClearA2: TButton;
    Panel2: TPanel;
    GridPanelLayout2: TGridPanelLayout;
    Edit2B1: TEdit;
    Edit2B2: TEdit;
    Edit2B3: TEdit;
    Edit2B4: TEdit;
    procedure btnCalculate2AClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnClearA2Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

{$R *.fmx}

procedure TForm3.btnCalculate2AClick(Sender: TObject);
var
  aa, ab, bb, ba, Baa, Bab, Bba, Bbb, determinant: Double;
begin

  aa := strtofloat(Edit2A1.Text); // set the value of aa
  ab := strtofloat(Edit2A2.Text); // set the value of ab
  ba := strtofloat(Edit2A3.Text); // set the value of ba
  bb := strtofloat(Edit2A4.Text); // set the value of bb

  if ComboBox1.ItemIndex = 0 then
  begin
    lbSolution2.Visible := False;
    Edit2A1.Text := floattostr(aa);
    // Change  the aa of matrix with aa and display it
    Edit2A2.Text := floattostr(ba);
    // Change  the ab of matrix with ba and display it
    Edit2A3.Text := floattostr(ab);
    // Change  the ba of matrix with ab and display it
    Edit2A4.Text := floattostr(bb);
    // Change  the bb of matrix with bb and display it
  end;
  if ComboBox1.ItemIndex = 1 then
  begin

    determinant := (aa * bb) - (ab * ba); // Calculate the determinant
    Memo1.Lines.Add('Determinant is: ' + floattostr(determinant));
    // Addes the determinant to memo1
    Memo1.Visible := true; // Display result in memo1
    lbSolution2.Visible := true; // Display solution lable
    lbSolution2.Text := 'Solution';
  end;
  if ComboBox1.ItemIndex = 2 then
  begin
    lbSolution2.Visible := False;
    determinant := (aa * bb) - (ab * ba);
    aa := (1 / determinant) * bb; // calculates the aa of matrix
    ab := (1 / determinant) * (-ab); // calculates the ab of matrix
    ba := (1 / determinant) * (-ba); // calculates the ba of matrix
    bb := (1 / determinant) * (strtofloat(Edit2A1.Text));
    // calculates the bb of matrix. Because the aa get a new value and we need the first value of it, we have to choose it from edit box.

    Edit2A1.Text := floattostr(aa); // Display the aa of matrix
    Edit2A2.Text := floattostr(ab); // Display the ab of matrix
    Edit2A3.Text := floattostr(ba); // Display the ba of matrix
    Edit2A4.Text := floattostr(bb); // Display the bb of matrix

  end;
  if ComboBox1.ItemIndex = 3 then
  begin
    Baa := strtofloat(Edit2B1.Text); // set the value of aa
    Bab := strtofloat(Edit2B2.Text); // set the value of ab
    Bba := strtofloat(Edit2B3.Text); // set the value of ba
    Bbb := strtofloat(Edit2B4.Text); // set the value of bb

    Baa := (aa * Baa) + (ab * Bba);
    Bab := (aa * Bab) + (ab * Bbb);
    Bba := (ba * Baa) + (bb * Bba);
    Bbb := (ba * Bab) + (bb * Bbb);

    Edit2B1.Text := floattostr(Baa); // Display the aa of matrix
    Edit2B2.Text := floattostr(Bab); // Display the ab of matrix
    Edit2B3.Text := floattostr(Bba); // Display the ba of matrix
    Edit2B4.Text := floattostr(Bbb); // Display the bb of matrix

    lbSolution2.Text := 'Solution';

  end;

end;

procedure TForm3.btnClearA2Click(Sender: TObject);
begin
  Memo1.Lines.Clear; // Clear mem1
  Edit2A1.Text := ''; // Clear Edit
  Edit2A2.Text := ''; // Clear Edit
  Edit2A3.Text := ''; // Clear Edit
  Edit2A4.Text := ''; // Clear Edit

  Edit2B1.Text := ''; // Clear Edit
  Edit2B2.Text := ''; // Clear Edit
  Edit2B3.Text := ''; // Clear Edit
  Edit2B4.Text := ''; // Clear Edit

end;

procedure TForm3.ComboBox1Change(Sender: TObject);
begin
  Panel1.Visible := true;
  Memo1.Visible := False;
  Label1.Visible := true;
  if ComboBox1.ItemIndex >= 3 then
  // changes the visibility of Matrix B if you choose multiplication, subtraction, addition or divition.
  begin
    Panel2.Visible := true;
    lbSolution2.Visible := true;
    lbSolution2.Text := 'Matrix B';
  end
  else // changes the visibility of Matrix B if you choose determinant, transpose or invers.
  begin
    Panel2.Visible := False;
    lbSolution2.Visible := False;
  end;
end;

procedure TForm3.FormCreate(Sender: TObject);
begin
  Memo1.Visible := False;
  lbSolution2.Visible := False;
  Panel2.Visible := False;
  Panel1.Visible := False;
  Label1.Visible := False;
end;

end.
