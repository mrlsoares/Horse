object DM: TDM
  OldCreateOrder = False
  Height = 763
  Width = 1020
  object FDPhysPgDriverLink: TFDPhysPgDriverLink
    VendorLib = 'C:\VerusSolutions\dll\libpq.dll'
    Left = 76
    Top = 29
  end
  object Conexao: TFDConnection
    Params.Strings = (
      'Server=localhost'
      'User_Name=postgres'
      'Password=postgres!@#$%2344'
      'Database=verussolution'
      'DriverID=PG')
    Connected = True
    LoginPrompt = False
    Left = 268
    Top = 29
  end
  object FDGUIxWaitCursor: TFDGUIxWaitCursor
    Provider = 'Console'
    Left = 180
    Top = 29
  end
  object FdNatureza: TFDQuery
    Connection = Conexao
    SQL.Strings = (
      'select *'
      '  from public.tbl_natureza'
      'order by id_natureza')
    Left = 344
    Top = 28
    object FdNaturezaid_natureza: TIntegerField
      FieldName = 'id_natureza'
      Origin = 'id_natureza'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object FdNaturezanatureza: TWideStringField
      FieldName = 'natureza'
      Origin = 'natureza'
      Size = 200
    end
    object FdNaturezadata_cadastro: TDateField
      FieldName = 'data_cadastro'
      Origin = 'data_cadastro'
    end
    object FdNaturezadata_alteracao: TDateField
      FieldName = 'data_alteracao'
      Origin = 'data_alteracao'
    end
    object FdNaturezaativo: TBooleanField
      FieldName = 'ativo'
      Origin = 'ativo'
    end
  end
end
