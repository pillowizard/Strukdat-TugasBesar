unit Form_Main_Unit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Menus, MMSystem, ExtCtrls, Form_About_Unit, Form_Splash_Unit,
  Kumpulan_Fungsi;

type
  TForm_Main = class(TForm)
    GroupBox_Menu: TGroupBox;
    GroupBox_View: TGroupBox;
    GroupBox_Meja1: TGroupBox;
    LabelMeja1: TLabel;
    TextMeja1: TEdit;
    Image_PanggilMeja1: TImage;
    GroupBox_Meja2: TGroupBox;
    TextMeja2: TEdit;
    LabelMeja2: TLabel;
    Image_PanggilMeja2: TImage;
    MainMenu_Utama: TMainMenu;
    Menu_File: TMenuItem;
    Menu_Exit: TMenuItem;
    Menu_Help: TMenuItem;
    Menu_About: TMenuItem;
    CmdShowHide: TButton;
    CmdPanggil_Meja1: TButton;
    CmdPanggil_Meja2: TButton;
    GroupBox_Antrian: TGroupBox;
    RadioButton_Bisnis: TRadioButton;
    RadioButton_Personal: TRadioButton;
    CmdTambahAntrian: TButton;
    GroupBox1: TGroupBox;
    procedure Menu_AboutClick(Sender: TObject);
    procedure Image_PanggilMeja1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Menu_ExitClick(Sender: TObject);
    procedure Image_PanggilMeja2Click(Sender: TObject);
    procedure CmdShowHideClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CmdTambahAntrianClick(Sender: TObject);
    procedure CmdPanggil_Meja1Click(Sender: TObject);
    procedure CmdPanggil_Meja2Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
    bilang_teks:string;
  end;

var
  Form_Main: TForm_Main;

implementation

{$R *.dfm}

procedure TForm_Main.Menu_AboutClick(Sender: TObject);
begin
     Form_About.Show;
end;

procedure TForm_Main.Image_PanggilMeja1Click(Sender: TObject);

begin
     Kumpulan_Fungsi.panggil_suara(bilang_saja(TextMeja1.Text), '1');
end;

procedure TForm_Main.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
     if (Application.MessageBox('Keluar dari aplikasi Antrian Bank?','Keluar Aplikasi', MB_YESNO or MB_ICONQUESTION) = ID_NO) then
     begin
          CanClose := false;
     end;
end;

procedure TForm_Main.Menu_ExitClick(Sender: TObject);
begin
     Form_Main.Close;
end;

procedure TForm_Main.Image_PanggilMeja2Click(Sender: TObject);
begin
     Kumpulan_Fungsi.panggil_suara(bilang_saja(TextMeja2.Text), '2');
end;

procedure TForm_Main.CmdShowHideClick(Sender: TObject);
begin
     if (CmdShowHide.Caption = 'Show') then
     begin
          CmdShowHide.Caption := 'Hide';
          Form_Main.Height := 437;
     end
     else if (CmdShowHide.Caption = 'Hide') then
     begin
          CmdShowHide.Caption := 'Show';
          Form_Main.Height := 290;
     end
     else
     begin
          //Injection found
     end;
end;

procedure TForm_Main.FormCreate(Sender: TObject);
begin
     if (run_once = false) then
     begin
          Form_Main.Hide;
          with TForm_Splash.Create(nil) do
          begin
               try
                  ShowModal;
               finally
                  Free;
               end;
          end;
     end;
     RadioButton_Bisnis.Checked := true;
     Kumpulan_Fungsi.buat_tree(root);
     TextMeja1.Text := Kumpulan_Fungsi.antrian_akhir(tree);
     TextMeja2.Text := Kumpulan_Fungsi.antrian_akhir(tree); 
end;

procedure TForm_Main.CmdTambahAntrianClick(Sender: TObject);
begin
     if (RadioButton_Bisnis.Checked) then
     begin

     end
     else if (RadioButton_Personal.Checked) then
     begin
          
     end;
end;

procedure TForm_Main.CmdPanggil_Meja1Click(Sender: TObject);
begin
     Kumpulan_Fungsi.panggil_suara(bilang_saja(TextMeja1.Text), '1');
end;

procedure TForm_Main.CmdPanggil_Meja2Click(Sender: TObject);
begin
     Kumpulan_Fungsi.panggil_suara(bilang_saja(TextMeja2.Text), '2');
end;

end.

