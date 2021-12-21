object dmWkTeste: TdmWkTeste
  OldCreateOrder = False
  Height = 327
  Width = 424
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=bdda0swk'
      'User_Name=root'
      'DriverID=MySQL')
    Connected = True
    LoginPrompt = False
    Left = 40
    Top = 16
  end
  object FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink
    Left = 152
    Top = 24
  end
  object fdtCliente: TFDTable
    IndexFieldNames = 'Codigo'
    Connection = FDConnection1
    UpdateOptions.UpdateTableName = 'bdda0swk.cliente'
    TableName = 'bdda0swk.cliente'
    Left = 56
    Top = 72
    object fdtClienteCodigo: TFDAutoIncField
      FieldName = 'Codigo'
      Origin = 'Codigo'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object fdtClienteNome: TStringField
      FieldName = 'Nome'
      Origin = 'Nome'
      Required = True
      Size = 30
    end
    object fdtClienteCidade: TStringField
      FieldName = 'Cidade'
      Origin = 'Cidade'
      Required = True
      Size = 30
    end
    object fdtClienteUF: TStringField
      FieldName = 'UF'
      Origin = 'UF'
      Required = True
      Size = 2
    end
  end
  object fdqCliente: TFDQuery
    Connection = FDConnection1
    Left = 192
    Top = 88
  end
  object fdqProcuraProduto: TFDQuery
    Connection = FDConnection1
    Left = 296
    Top = 72
  end
  object dsProdutoPedido: TDataSource
    DataSet = cdsProdutosPedido
    Left = 192
    Top = 144
  end
  object fdqGravaPedido: TFDQuery
    Connection = FDConnection1
    Left = 184
    Top = 216
  end
  object fdqGravaProdutosGeral: TFDQuery
    Connection = FDConnection1
    Left = 296
    Top = 216
  end
  object fdqAchaPedido: TFDQuery
    Connection = FDConnection1
    Left = 32
    Top = 216
  end
  object fdqAchaItensPedido: TFDQuery
    Connection = FDConnection1
    Left = 80
    Top = 248
  end
  object fdqmodificaprod: TFDQuery
    Connection = FDConnection1
    Left = 280
    Top = 272
  end
  object cdsProdutosPedido: TClientDataSet
    PersistDataPacket.Data = {
      AB0000009619E0BD010000001800000006000000000003000000AB000A436F64
      50726F6475746F04000100000000000944657363726963616F01004900000001
      00055749445448020002001E000A5175616E7469646164650800040000000000
      0856616C6F72556E69080004000000010007535542545950450200490006004D
      6F6E6579000C4E756D65726F50656469646F04000100000000000A4175746F69
      6E6372656D04000100000000000000}
    Active = True
    Aggregates = <>
    Params = <>
    OnCalcFields = cdsProdutosPedidoCalcFields
    Left = 96
    Top = 136
    object cdsProdutosPedidoCodProduto: TIntegerField
      FieldName = 'CodProduto'
    end
    object cdsProdutosPedidoDescricao: TStringField
      FieldName = 'Descricao'
      Size = 30
    end
    object cdsProdutosPedidoQuantidade: TFloatField
      FieldName = 'Quantidade'
    end
    object cdsProdutosPedidoValorUni: TCurrencyField
      FieldName = 'ValorUni'
    end
    object cdsProdutosPedidoNumeroPedido: TIntegerField
      FieldName = 'NumeroPedido'
    end
    object cdsProdutosPedidoValorTotal: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'ValorTotal'
      Calculated = True
    end
    object cdsProdutosPedidoAutoincrem: TIntegerField
      FieldName = 'Autoincrem'
      Visible = False
    end
  end
  object fdqDeletaPedidoST: TFDQuery
    Connection = FDConnection1
    Left = 328
    Top = 152
  end
end
