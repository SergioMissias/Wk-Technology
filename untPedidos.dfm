object frmCliente: TfrmCliente
  Left = 0
  Top = 0
  Caption = 'Digita'#231#227'o de Pedidos - WK technology'
  ClientHeight = 556
  ClientWidth = 1126
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object TabControl1: TTabControl
    Left = 0
    Top = 0
    Width = 1126
    Height = 556
    Align = alClient
    TabOrder = 0
    Tabs.Strings = (
      'Clientes')
    TabIndex = 0
    object Panel1: TPanel
      Left = 4
      Top = 24
      Width = 1118
      Height = 129
      Align = alTop
      Color = clGray
      ParentBackground = False
      TabOrder = 0
      object Label1: TLabel
        Left = 8
        Top = 33
        Width = 87
        Height = 13
        Caption = 'Informe o Cliente:'
      end
      object lblNomeCliente: TLabel
        Left = 296
        Top = 33
        Width = 70
        Height = 13
        Caption = 'lblNomeCliente'
      end
      object lblCidade: TLabel
        Left = 8
        Top = 59
        Width = 33
        Height = 13
        Caption = 'Cidade'
      end
      object lblUF: TLabel
        Left = 8
        Top = 82
        Width = 13
        Height = 13
        Caption = 'UF'
      end
      object sbProcurarCliente: TSpeedButton
        Left = 228
        Top = 29
        Width = 25
        Height = 24
        Cursor = crHandPoint
        OnClick = sbProcurarClienteClick
      end
      object edtCliente: TEdit
        Left = 101
        Top = 30
        Width = 121
        Height = 21
        TabOrder = 0
        OnChange = edtClienteChange
        OnExit = sbProcurarClienteClick
      end
      object pnlProcPed: TPanel
        Left = 688
        Top = 1
        Width = 429
        Height = 127
        Align = alRight
        Color = clSilver
        ParentBackground = False
        TabOrder = 1
        object Label11: TLabel
          Left = 32
          Top = 8
          Width = 52
          Height = 13
          Caption = 'Pedido No:'
        end
        object edtAchaPedido: TEdit
          Left = 120
          Top = 5
          Width = 121
          Height = 21
          TabOrder = 0
        end
        object btnDeletarPedido: TBitBtn
          Left = 272
          Top = 81
          Width = 121
          Height = 25
          Caption = 'Cancelar Pedido'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 2
          OnClick = btnDeletarPedidoClick
        end
        object btnPdAntigos: TBitBtn
          Left = 266
          Top = 3
          Width = 123
          Height = 25
          Caption = 'Pedidos Antigos'
          TabOrder = 1
          OnClick = btnPdAntigosClick
        end
      end
    end
    object Panel2: TPanel
      Left = 4
      Top = 153
      Width = 1118
      Height = 256
      Align = alTop
      Caption = 'Panel2'
      Color = clTeal
      ParentBackground = False
      TabOrder = 1
      object Label2: TLabel
        Left = 8
        Top = 6
        Width = 64
        Height = 13
        Caption = 'Cod. Produto'
      end
      object Label3: TLabel
        Left = 264
        Top = 6
        Width = 46
        Height = 13
        Caption = 'Descri'#231#227'o'
      end
      object lbldescricao: TLabel
        Left = 152
        Top = 40
        Width = 55
        Height = 13
        Caption = 'lbldescricao'
      end
      object Label5: TLabel
        Left = 528
        Top = 6
        Width = 56
        Height = 13
        Caption = 'Quantidade'
      end
      object Label6: TLabel
        Left = 688
        Top = 6
        Width = 64
        Height = 13
        Caption = 'Valor Unit'#225'rio'
      end
      object Label7: TLabel
        Left = 872
        Top = 6
        Width = 92
        Height = 13
        Caption = 'Valor Total Produto'
      end
      object lblValorTotal: TLabel
        Left = 942
        Top = 40
        Width = 22
        Height = 13
        Caption = '0,00'
      end
      object edtCodProduto: TEdit
        Left = 8
        Top = 32
        Width = 121
        Height = 21
        TabOrder = 0
        OnExit = edtCodProdutoExit
      end
      object edtQuantidade: TEdit
        Left = 520
        Top = 32
        Width = 105
        Height = 21
        TabOrder = 1
        OnExit = edtQuantidadeExit
      end
      object btnInserirProd: TBitBtn
        Left = 1032
        Top = 30
        Width = 75
        Height = 25
        Caption = 'Inserir'
        TabOrder = 3
        OnClick = btnInserirProdClick
      end
      object dbProdutoPedido: TDBGrid
        Left = 1
        Top = 72
        Width = 1116
        Height = 183
        Align = alBottom
        DataSource = dmWkTeste.dsProdutoPedido
        GradientEndColor = clWhite
        GradientStartColor = clSilver
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 4
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -13
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnKeyDown = dbProdutoPedidoKeyDown
        OnKeyPress = dbProdutoPedidoKeyPress
      end
      object edtValorUni: TEdit
        Left = 668
        Top = 32
        Width = 121
        Height = 21
        TabOrder = 2
        OnExit = edtValorUniExit
      end
    end
    object Panel3: TPanel
      Left = 4
      Top = 511
      Width = 1118
      Height = 41
      Align = alBottom
      Caption = 'Panel3'
      Color = clLime
      ParentBackground = False
      TabOrder = 2
      object Label9: TLabel
        Left = 984
        Top = 1
        Width = 105
        Height = 39
        Align = alRight
        Caption = 'Valor Total do Pedido:'
        Layout = tlCenter
        ExplicitHeight = 13
      end
      object lblValorTotaPedido: TLabel
        AlignWithMargins = True
        Left = 1092
        Top = 4
        Width = 22
        Height = 33
        Align = alRight
        BiDiMode = bdRightToLeft
        Caption = '0,00'
        ParentBiDiMode = False
        Layout = tlCenter
        ExplicitHeight = 13
      end
    end
    object btnGravarPedido: TBitBtn
      Left = 976
      Top = 440
      Width = 135
      Height = 49
      Caption = 'Gravar Pedidos'
      TabOrder = 3
      OnClick = btnGravarPedidoClick
    end
  end
end
