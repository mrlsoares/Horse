unit View.index;

interface

uses
  Data.DB,
  Horse,
  System.JSON,
  System.SysUtils,
  DataSet.Serialize;

  procedure Registro;
  procedure Index(Req: THorseRequest; Res: THorseResponse; Next: TProc);
  procedure Nome(Req: THorseRequest; Res: THorseResponse; Next: TProc);
  procedure ComRetornoBase(Req: THorseRequest; Res: THorseResponse; Next: TProc);

implementation

uses
  System.Generics.Collections, Model.DataModule;



procedure Index(Req: THorseRequest; Res: THorseResponse; Next: TProc) ;
var
 // lista: TJSONArray;
 // DataSource: TDatasource;
  objeto: TJSONObject;
  encargos: TJSONArray;
  parametros: TDictionary<String,String>;
  chave,str,mensagem:string;
begin
  mensagem := '<h1>Ola mundo!!</h1>';
  {try
     Res.Send(mensagem);
  except on E: Exception do
    begin
      Res.Send('Erro '+E.Message).Status(500);
    end;
  end;}

  objeto := TJSONObject.Create;
  parametros := Req.Query.Dictionary;
  try

    objeto.AddPair('codigo' , TJSONNumber.Create(111));
    objeto.AddPair('Mensagem' , TJSONString.Create(mensagem));
    for chave in parametros.Keys do
    begin
      if parametros.TryGetValue(chave,str) then
        objeto.AddPair(trim(chave),TJSONString.Create(str)) ;
    end;


    Res.Send<TJSONObject>(objeto);
  except on E: Exception do
    begin
      Res.Send(TJSONObject.Create(TJSonPair.Create('Erro',E.Message))).Status(500);
    end;
  end
end;
procedure Nome(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  objeto: TJSONObject;
  mensagem:string;
begin
  mensagem:= 'Olá ';
  Req.Params['nome'];
  try
     Res.Send('<h1>'+mensagem+'<font color="#0000FF">'+ Req.Params['nome']+'</font></h1>');
  except on E: Exception do
    begin
      Res.Send('Erro '+E.Message).Status(500);
    end;
  end;
end;

procedure ComRetornoBase(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  lista: TJSONArray;
  DataModule :TDM;
begin
  DataModule := TDM.Create(nil);
  try
   try
     if not DataModule.FdNatureza.Active then
       DataModule.FdNatureza.Open;

     lista := DataModule.FdNatureza.ToJSONArray;
      Res.Send<TJSONArray>(lista);
  except on E: Exception do
    begin
      Res.Send('Erro '+E.Message).Status(500);
    end;

  end; 
  finally
    FreeAndNil(DataModule);
  end;
  
end;

procedure Registro;
begin
  THorse.Get('/', Index);
  THorse.Get('/nome/:nome', Nome);
  THorse.Get('/retorno/query/array', ComRetornoBase);
end;

end.
