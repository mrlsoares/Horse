program ApiHorse;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  Horse,
  Horse.CORS,
  Horse.JWT,
  Horse.Jhonson,
  Horse.HandleException,
  DataSet.Serialize,
  DataSet.Serialize.Config,
  View.index in 'View\View.index.pas' ,
  Model.DataModule in 'Model\Model.DataModule.pas' {DM: TDataModule};

var
  App: THorse;

begin

 //ReportMemoryLeaksOnShutdown := True;
 App := THorse.Create;
 App.Port := 9001;

 App.Use(CORS)
     .Use(Jhonson())
     .Use(HandleException);



  TDataSetSerializeConfig.GetInstance.Export.FormatCurrency := '#,##0.00';
  TDataSetSerializeConfig.GetInstance.Export.FormatDate := 'DD/MM/YYYY';
  TDataSetSerializeConfig.GetInstance.CaseNameDefinition := TCaseNameDefinition(cndLower);;
  TDataSetSerializeConfig.GetInstance.DataSetPrefix := ['mt', 'qry','FDQ','mem'];
  View.index.Registro;
  App.Listen;
end.
