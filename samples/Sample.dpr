program Sample;

uses
  Vcl.Forms,
  DataSet.Serialize.Helper in '..\src\helpers\DataSet.Serialize.Helper.pas',
  BooleanField.Types in '..\src\types\BooleanField.Types.pas',
  DataSet.Serialize.Intf in '..\src\interfaces\DataSet.Serialize.Intf.pas',
  DataSet.Serialize.DS.Intf in '..\src\interfaces\DataSet.Serialize.DS.Intf.pas',
  DataSet.Serialize.JSON.Intf in '..\src\interfaces\DataSet.Serialize.JSON.Intf.pas',
  Providers.DataSet.Serialize in '..\src\providers\Providers.DataSet.Serialize.pas',
  DataSet.Serialize.Impl in '..\src\core\DataSet.Serialize.Impl.pas',
  DataSet.Serialize.DS.Impl in '..\src\core\DataSet.Serialize.DS.Impl.pas',
  DataSet.Serialize.JSON.Impl in '..\src\core\DataSet.Serialize.JSON.Impl.pas',
  Providers.DataSet.Serialize.Constants in '..\src\providers\Providers.DataSet.Serialize.Constants.pas',
  Language.Types in '..\src\types\Language.Types.pas',
  DataSet.Serialize.Samples in 'src\DataSet.Serialize.Samples.pas' {FrmSamples};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmSamples, FrmSamples);
  Application.Run;
end.