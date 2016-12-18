unit Form_Splash_Unit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls, StdCtrls, XPMan, ComCtrls, Kumpulan_Fungsi;

type
  TForm_Splash = class(TForm)
    Image_Logo: TImage;
    Label_NamaAplikasi: TLabel;
    XPManifest: TXPManifest;
    ProgressBar_Splash: TProgressBar;
    Label_Persen: TLabel;
    Label_Keterangan: TLabel;
    Timer_Splash: TTimer;
    procedure Timer_SplashTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_Splash: TForm_Splash;

implementation

{$R *.dfm}

procedure TForm_Splash.Timer_SplashTimer(Sender: TObject);
begin
     if (ProgressBar_Splash.Position <= ProgressBar_Splash.Max) then
     begin
          ProgressBar_Splash.Position := ProgressBar_Splash.Position + 2;
          Label_Persen.Caption := IntToStr(ProgressBar_Splash.Position) + ' %';
          case (ProgressBar_Splash.Position) of
                0   : Label_Keterangan.Caption := 'Tugas Besar';
                14  : Label_Keterangan.Caption := 'Struktur Data';
                30  : Label_Keterangan.Caption := 'Dosen Mata Kuliah';
                40  : Label_Keterangan.Caption := 'Andri Heryandi., S.T., M.T.';
                50  : Label_Keterangan.Caption := 'ABank Versi 1.0' ;
                54  : Label_Keterangan.Caption := 'Dibuat oleh';
                60  : Label_Keterangan.Caption := 'Raka Suryaardi Widjaja / 10115253';
                72  : Label_Keterangan.Caption := 'XX1 / YY1';
                82  : Label_Keterangan.Caption := 'XX2 / YY2';
                92  : Label_Keterangan.Caption := 'XX3 / YY3';
                100 : begin
                           Close;
                           run_once := true;
                      end;
          end;
     end;
end;

procedure TForm_Splash.FormCreate(Sender: TObject);
begin
     Timer_Splash.Enabled := true;
     ProgressBar_Splash.Position := 0;
end;

end.
