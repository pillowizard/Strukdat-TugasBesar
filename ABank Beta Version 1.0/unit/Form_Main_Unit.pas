unit Form_Main_Unit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Menus, MMSystem, ExtCtrls, Form_About_Unit,
  Kumpulan_Fungsi;

type
  TForm_Main = class(TForm)
    GroupBox_Menu: TGroupBox;
    GroupBox_View: TGroupBox;
    GroupBox_Meja1: TGroupBox;
    LabelMeja1: TLabel;
    TextMeja1: TEdit;
    Image_PanggilMeja1: TImage;
    CmdAddPersonal: TButton;
    CmdAddBisnis: TButton;
    GroupBox_Meja2: TGroupBox;
    TextMeja2: TEdit;
    LabelMeja2: TLabel;
    Image_PanggilMeja2: TImage;
    MainMenu_Utama: TMainMenu;
    Menu_File: TMenuItem;
    Menu_Exit: TMenuItem;
    Menu_Help: TMenuItem;
    Menu_About: TMenuItem;
    procedure Menu_ExitClick(Sender: TObject);
    procedure Menu_AboutClick(Sender: TObject);
    procedure Image_PanggilMeja1Click(Sender: TObject);
    procedure CmdAddBisnisClick(Sender: TObject);
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

procedure TForm_Main.Menu_ExitClick(Sender: TObject);
begin
     if (application.MessageBox('Keluar dari aplikasi Antrian Bank?','Keluar Aplikasi', MB_YESNO or MB_ICONQUESTION) = ID_YES) then
     begin
          Form_Main.Close;
     end;
end;

procedure TForm_Main.Menu_AboutClick(Sender: TObject);
begin
     Form_About.Show;
end;

procedure TForm_Main.Image_PanggilMeja1Click(Sender: TObject);

begin
     bilang_teks := TextMeja1.Text;
     TextMeja1.Text := Kumpulan_Fungsi.bilang_saja(bilang_teks);
end;

procedure TForm_Main.CmdAddBisnisClick(Sender: TObject);

begin
     sndPlaySound(PChar(Kumpulan_Fungsi.app_path() + ('\sounds\indonesian\nomor-antrian.wav')), snd_Async or snd_NoDefault);
end;

end.
