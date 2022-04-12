unit Model.DataModule;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Phys.PGDef, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Comp.UI, Data.DB, FireDAC.Comp.Client, FireDAC.Phys.PG, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.ConsoleUI.Wait;

type
  TDM = class(TDataModule)
    FDPhysPgDriverLink: TFDPhysPgDriverLink;
    Conexao: TFDConnection;
    FDGUIxWaitCursor: TFDGUIxWaitCursor;
    FdNatureza: TFDQuery;
    FdNaturezaid_natureza: TIntegerField;
    FdNaturezanatureza: TWideStringField;
    FdNaturezadata_cadastro: TDateField;
    FdNaturezadata_alteracao: TDateField;
    FdNaturezaativo: TBooleanField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{%CLASSGROUP 'System.Classes.TPersistent'}

{$R *.dfm}

end.
