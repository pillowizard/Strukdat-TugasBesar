unit Kumpulan_Fungsi;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Controls, Forms,
  Dialogs, StdCtrls, Menus, MMSystem;

  function bilang_saja(bilang_teks:string):string;
  function app_path():string;
  procedure split_string(input_string:string; const pemisah:Char; const output_string:Tstrings);
  procedure panggil_suara(bilang_saja:string; meja:char);

  
type
   point=^node;
   node = record
              data:string;
              left, right:point;
            end;
var
   nomor_bilang:integer;
   bilang_teks:string;
   run_once:boolean;
   root, tree:point;

   procedure buat_tree(var root:point);
   function antrian_akhir(tree:point):string;
      
implementation

  function app_path():string;

  begin
       app_path := PChar(ExtractFilePath(ParamStr(0)));
  end;

  function terbilang(nomor_bilang:integer):string;
      function bilang(nomor_bilang:integer):string;
      begin
           case (nomor_bilang) of
               0:bilang:='';
               1:bilang:='satu';
               2:bilang:='dua';
               3:bilang:='tiga';
               4:bilang:='empat';
               5:bilang:='lima';
               6:bilang:='enam';
               7:bilang:='tujuh';
               8:bilang:='delapan';
               9:bilang:='sembilan';
               10:bilang:='sepuluh';
               11:bilang:='sebelas';
           end;
      end;
  begin
       if (nomor_bilang < 12) then
       begin
            terbilang := ' ' + bilang(nomor_bilang)
       end
       else if (nomor_bilang < 20) then
       begin
            terbilang := terbilang(nomor_bilang-10)+' belas'
       end
       else if (nomor_bilang < 100) then
       begin
            terbilang := terbilang(nomor_bilang div 10)+' puluh'+terbilang(nomor_bilang mod 10)
       end
       else if (nomor_bilang < 200) then
       begin
            terbilang := ' seratus'+terbilang(nomor_bilang-100)
       end
       else if (nomor_bilang < 1000) then
       begin
            terbilang := terbilang(nomor_bilang div 100)+' ratus'+terbilang(nomor_bilang mod 100)
       end
       else if (nomor_bilang < 2000) then
       begin
            terbilang := ' seribu'+terbilang(nomor_bilang-1000)
       end
       else if (nomor_bilang < 1000000) then
       begin
            terbilang := terbilang(nomor_bilang div 1000)+' ribu'+terbilang(nomor_bilang mod 1000)
       end;
  end;

  function bilang_saja(bilang_teks:string):string;

  var
      kode_eror:integer;
      
  begin
       delete(bilang_teks, 1, 2);
       val(bilang_teks, nomor_bilang, kode_eror);
       if (kode_eror <> 0) then
       begin
            bilang_saja := 'EROR';
       end     
       else
       begin
            if (nomor_bilang <= 9999) then
            begin
                 bilang_saja := terbilang(nomor_bilang);
            end
            else
            begin
                bilang_saja := 'EROR';
            end;
       end;
  end;

  procedure split_string(input_string:string; const pemisah:Char; const output_string:Tstrings);

  begin
       assert(assigned(output_string));
       output_string.Clear;
       output_string.Delimiter := pemisah;
       output_string.DelimitedText := input_string;
  end;

  procedure panggil_suara(bilang_saja:string; meja:char);

  var
     list:TStringList;
     i:integer;

  begin
       list := TStringList.Create;
       try
          split_string(bilang_saja,' ',list);
          if (list.Count > 0) then
          begin
               sndPlaySound(PChar(Kumpulan_Fungsi.app_path() + ('\sounds\indonesian\bell-in.wav')), snd_Async and snd_NoDefault);
               sndPlaySound(PChar(Kumpulan_Fungsi.app_path() + ('\sounds\indonesian\nomor-antrian.wav')), snd_Async and snd_NoDefault);
               for i:= 0 to list.Count - 1 do
               begin
                    sndPlaySound(PChar(Kumpulan_Fungsi.app_path() + ('\sounds\indonesian\'+ list[i] + '.wav')), snd_Async and snd_NoDefault);
               end;
               sleep(300);
               sndPlaySound(PChar(app_path() + ('\sounds\indonesian\di-meja.wav')), snd_Async and snd_NoDefault);
               case (meja) of
                    '1' : begin
                               sndPlaySound(PChar(app_path() + ('\sounds\indonesian\satu.wav')), snd_Async and snd_NoDefault);
                          end;
                    '2' : begin
                               sndPlaySound(PChar(app_path() + ('\sounds\indonesian\dua.wav')), snd_Async and snd_NoDefault);
                          end;
               end;
               sndPlaySound(PChar(Kumpulan_Fungsi.app_path() + ('\sounds\indonesian\bell-out.wav')), snd_Async and snd_NoDefault);
          end;
       finally
          list.Free;
       end;
  end;

  procedure buat_tree(var root:point);

  begin
       root := nil;
  end;

  procedure tambah_antrian(var tree:point; antrian:string);

  var
     baru:point;
     
  begin
       if (tree = nil) then
       begin
            new(baru);
            baru^.data := antrian;
            baru^.left := nil;
            baru^.right := nil;
            tree := baru;
       end
       else
       begin
            if (tree^.data > antrian) then
            begin
                 tambah_antrian(tree^.left, antrian);
            end
            else
            begin
                 tambah_antrian(tree^.right, antrian);
            end;
       end;
  end;

  function antrian_akhir(tree:point):string;

  begin
       if (tree = nil) then
       begin
            antrian_akhir := 'P-0000';
       end
       else
       begin
            antrian_akhir := tree^.data;
       end;
  end;

  procedure shift_up();

  begin

  end;

  procedure shift_down();

  begin

  end;
end.
