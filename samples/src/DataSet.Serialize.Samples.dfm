object FrmSamples: TFrmSamples
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'DataSet Serialize - Samples'
  ClientHeight = 571
  ClientWidth = 994
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pclDataSetSerialize: TPageControl
    Left = 0
    Top = 0
    Width = 994
    Height = 571
    ActivePage = tabDataSet
    Align = alClient
    TabOrder = 0
    object tabDataSet: TTabSheet
      Caption = 'DataSet'
      object Splitter1: TSplitter
        Left = 481
        Top = 0
        Width = 9
        Height = 543
        ExplicitLeft = 472
      end
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 481
        Height = 543
        Align = alLeft
        BevelOuter = bvNone
        ParentBackground = False
        TabOrder = 0
        object Label2: TLabel
          Left = 8
          Top = 12
          Width = 27
          Height = 13
          Caption = 'Name'
        end
        object Label3: TLabel
          Left = 264
          Top = 12
          Width = 39
          Height = 13
          Caption = 'Country'
        end
        object DBGrid1: TDBGrid
          Left = 0
          Top = 120
          Width = 481
          Height = 423
          Align = alBottom
          DataSource = dsDataSet
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'ID'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NAME'
              Width = 250
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'COUNTRY'
              Width = 145
              Visible = True
            end>
        end
        object edtName: TEdit
          Left = 8
          Top = 31
          Width = 250
          Height = 21
          TabOrder = 1
        end
        object edtCountry: TEdit
          Left = 264
          Top = 31
          Width = 124
          Height = 21
          TabOrder = 2
        end
        object Button2: TButton
          Left = 394
          Top = 29
          Width = 81
          Height = 25
          Caption = 'Append'
          TabOrder = 3
          OnClick = Button2Click
        end
        object Panel3: TPanel
          Left = 0
          Top = 79
          Width = 481
          Height = 41
          Align = alBottom
          BevelOuter = bvNone
          TabOrder = 4
          object Button1: TButton
            Left = 155
            Top = 0
            Width = 171
            Height = 41
            Align = alClient
            Caption = 'ToJSONArray'
            TabOrder = 0
            OnClick = Button1Click
          end
          object Button3: TButton
            Left = 326
            Top = 0
            Width = 155
            Height = 41
            Align = alRight
            Caption = 'SaveStructure'
            TabOrder = 1
            OnClick = Button3Click
          end
          object Button4: TButton
            Left = 0
            Top = 0
            Width = 155
            Height = 41
            Align = alLeft
            Caption = 'ToJSONObject'
            TabOrder = 2
            OnClick = Button4Click
          end
        end
      end
      object Panel2: TPanel
        Left = 490
        Top = 0
        Width = 496
        Height = 543
        Align = alClient
        BevelOuter = bvNone
        Caption = 'Panel2'
        TabOrder = 1
        object mmDataSet: TMemo
          Left = 0
          Top = 0
          Width = 496
          Height = 543
          Align = alClient
          ReadOnly = True
          ScrollBars = ssVertical
          TabOrder = 0
        end
      end
    end
    object tabJSON: TTabSheet
      Caption = 'JSON'
      ImageIndex = 1
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Splitter2: TSplitter
        Left = 481
        Top = 0
        Width = 9
        Height = 543
        ExplicitLeft = 475
        ExplicitTop = 16
      end
      object DBGridStructure: TDBGrid
        Left = 490
        Top = 0
        Width = 496
        Height = 543
        Align = alClient
        DataSource = dsJSON
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
      end
      object Panel4: TPanel
        Left = 0
        Top = 0
        Width = 481
        Height = 543
        Align = alLeft
        TabOrder = 1
        object mmJSONArray: TMemo
          Left = 1
          Top = 336
          Width = 479
          Height = 117
          Align = alTop
          Lines.Strings = (
            '['
            '  {'
            '    "NAME": "Vinicius Sanchez",'
            '    "COUNTRY": "Brazil"'
            '  },'
            '  {'
            '    "NAME": "Julio Cesar Senha",'
            '    "COUNTRY": "Brazil"'
            '  },'
            '  {'
            '    "NAME": "Mateus Vicente",'
            '    "COUNTRY": "Brazil"'
            '  },'
            '  {'
            '    "NAME": "Eduardo Viana Pessoa",'
            '    "COUNTRY": "Brazil"'
            '  },'
            '  {'
            '    "NAME": "Alan Carlos Echer",'
            '    "COUNTRY": "Brazil"'
            '  },'
            '  {'
            '    "NAME": "Luis Gustavo de Miranda",'
            '    "COUNTRY": "Brazil"'
            '  },'
            '  {'
            '    "NAME": "Fagner Granella",'
            '    "COUNTRY": "Brazil"'
            '  }'
            ']')
          ReadOnly = True
          ScrollBars = ssVertical
          TabOrder = 0
        end
        object Panel5: TPanel
          Left = 1
          Top = 308
          Width = 479
          Height = 28
          Align = alTop
          BevelOuter = bvNone
          ParentBackground = False
          TabOrder = 1
          object Button7: TButton
            Left = 0
            Top = 0
            Width = 479
            Height = 28
            Align = alClient
            Caption = 'Load from JSON Array'
            TabOrder = 0
            OnClick = Button7Click
          end
        end
        object Panel8: TPanel
          Left = 1
          Top = 453
          Width = 479
          Height = 28
          Align = alTop
          BevelOuter = bvNone
          ParentBackground = False
          TabOrder = 2
          object Button8: TButton
            Left = 0
            Top = 0
            Width = 479
            Height = 28
            Align = alClient
            Caption = 'Merge (Edit current record)'
            TabOrder = 0
            OnClick = Button8Click
          end
        end
        object mmMerge: TMemo
          Left = 1
          Top = 481
          Width = 479
          Height = 62
          Align = alTop
          Lines.Strings = (
            '{'
            '  "NAME": "Vinicius",'
            '  "COUNTRY": "United States"'
            '}')
          ReadOnly = True
          ScrollBars = ssVertical
          TabOrder = 3
        end
        object Panel9: TPanel
          Left = 1
          Top = 1
          Width = 479
          Height = 307
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 4
          object Panel10: TPanel
            Left = 209
            Top = 0
            Width = 270
            Height = 307
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 0
            object mmJSONObject: TMemo
              Left = 0
              Top = 28
              Width = 270
              Height = 71
              Align = alClient
              Lines.Strings = (
                '{'
                '  "NAME": "Vinicius Sanchez",'
                '  "COUNTRY": "Brazil"'
                '}')
              ReadOnly = True
              ScrollBars = ssVertical
              TabOrder = 0
            end
            object Panel6: TPanel
              Left = 0
              Top = 0
              Width = 270
              Height = 28
              Align = alTop
              BevelOuter = bvNone
              ParentBackground = False
              TabOrder = 1
              object Button6: TButton
                Left = 0
                Top = 0
                Width = 270
                Height = 28
                Align = alClient
                Caption = 'Load from JSON Object'
                TabOrder = 0
                OnClick = Button6Click
              end
            end
            object mmValidateJSON: TMemo
              Left = 0
              Top = 127
              Width = 270
              Height = 58
              Align = alBottom
              Lines.Strings = (
                '{'
                '  "COUNTRY": "Brazil"'
                '}')
              ReadOnly = True
              ScrollBars = ssVertical
              TabOrder = 2
            end
            object Panel12: TPanel
              Left = 0
              Top = 99
              Width = 270
              Height = 28
              Align = alBottom
              BevelOuter = bvNone
              ParentBackground = False
              TabOrder = 3
              object Button9: TButton
                Left = 0
                Top = 0
                Width = 270
                Height = 28
                Align = alClient
                Caption = 'Validate JSON'
                TabOrder = 0
                OnClick = Button9Click
              end
            end
            object mmJSONArrayValidate: TMemo
              Left = 0
              Top = 185
              Width = 270
              Height = 122
              Align = alBottom
              ReadOnly = True
              ScrollBars = ssVertical
              TabOrder = 4
            end
          end
          object Panel13: TPanel
            Left = 0
            Top = 0
            Width = 209
            Height = 307
            Align = alLeft
            BevelOuter = bvNone
            TabOrder = 1
            object Panel7: TPanel
              Left = 0
              Top = 0
              Width = 209
              Height = 28
              Align = alTop
              BevelOuter = bvNone
              ParentBackground = False
              TabOrder = 0
              object Button5: TButton
                Left = 0
                Top = 0
                Width = 209
                Height = 28
                Align = alClient
                Caption = 'Load structure'
                TabOrder = 0
                OnClick = Button5Click
              end
            end
            object mmStructure: TMemo
              Left = 0
              Top = 28
              Width = 209
              Height = 279
              Align = alClient
              Lines.Strings = (
                '['
                '  {'
                '    "FieldName": "ID",'
                '    "DisplayLabel": "Id",'
                '    "DataType": "ftInteger",'
                '    "Size": 0,'
                '    "Key": false,'
                '    "Origin": "",'
                '    "Required": false,'
                '    "Visible": true,'
                '    "ReadOnly": true,'
                '    "AutoGenerateValue": "arAutoInc"'
                '  },'
                '  {'
                '    "FieldName": "NAME",'
                '    "DisplayLabel": "Name",'
                '    "DataType": "ftString",'
                '    "Size": 100,'
                '    "Key": false,'
                '    "Origin": "",'
                '    "Required": true,'
                '    "Visible": true,'
                '    "ReadOnly": false,'
                '    "AutoGenerateValue": "arNone"'
                '  },'
                '  {'
                '    "FieldName": "COUNTRY",'
                '    "DisplayLabel": "Country",'
                '    "DataType": "ftString",'
                '    "Size": 60,'
                '    "Key": false,'
                '    "Origin": "",'
                '    "Required": false,'
                '    "Visible": false,'
                '    "ReadOnly": false,'
                '    "AutoGenerateValue": "arNone"'
                '  }'
                ']')
              ReadOnly = True
              ScrollBars = ssVertical
              TabOrder = 1
            end
          end
        end
      end
    end
    object tabJSONNested: TTabSheet
      Caption = 'JSON Nested Object'
      ImageIndex = 2
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Panel11: TPanel
        Left = 313
        Top = 0
        Width = 673
        Height = 543
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        object DBGrid2: TDBGrid
          Left = 0
          Top = 0
          Width = 673
          Height = 256
          Align = alClient
          DataSource = dsJSONNested
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'ESTADO'
              Width = 300
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SIGLA'
              Width = 50
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PAIS.NOME'
              Width = 300
              Visible = True
            end>
        end
        object DBGrid3: TDBGrid
          Left = 0
          Top = 256
          Width = 673
          Height = 287
          Align = alBottom
          DataSource = dsJSONNestedObject
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'NOME'
              Width = 596
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CEP'
              Visible = True
            end>
        end
      end
      object Panel14: TPanel
        Left = 0
        Top = 0
        Width = 313
        Height = 543
        Align = alLeft
        BevelOuter = bvNone
        TabOrder = 1
        object mmJSONNested: TMemo
          Left = 0
          Top = 33
          Width = 313
          Height = 510
          Align = alClient
          Lines.Strings = (
            '[{'
            '        "estado": "S'#227'o Paulo",'
            '        "sigla": "SP",'
            '        "pais": {'
            '            "nome": "Brasil",'
            '            "sigla": "BRL"'
            '        },'
            '        "cidades": [{'
            '                "nome": "Fernand'#243'polis",'
            '                "cep": "15600-000"'
            '            }, {'
            '                "nome": "Votuporanga",'
            '                "cep": "12600-100"'
            '            }, {'
            '                "nome": "Jales",'
            '                "cep": "14859-000"'
            '            }, {'
            '                "nome": "S'#227'o Jos'#233' do Rio Preto",'
            '                "cep": "18450-450"'
            '            }, {'
            '                "nome": "B'#225'lsamo",'
            '                "cep": "15140-000"'
            '            }'
            '        ]'
            '    }, {'
            '        "estado": "Paran'#225'",'
            '        "sigla": "PR",'
            '        "pais": {'
            '            "nome": "Brasil",'
            '            "sigla": "BRL"'
            '        },'
            '        "cidades": [{'
            '                "nome": "Maring'#225'",'
            '                "cep": "87050-000"'
            '            }, {'
            '                "nome": "Londrina",'
            '                "cep": "86010-190"'
            '            }'
            '        ]'
            '    }'
            ']')
          ScrollBars = ssVertical
          TabOrder = 0
        end
        object Button10: TButton
          Left = 0
          Top = 0
          Width = 313
          Height = 33
          Align = alTop
          Caption = 'Load from JSON Array'
          TabOrder = 1
          OnClick = Button10Click
        end
      end
    end
  end
  object mtDataSet: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 912
    Top = 496
    object mtDataSetID: TIntegerField
      AutoGenerateValue = arAutoInc
      DisplayLabel = 'Id'
      FieldName = 'ID'
      ReadOnly = True
    end
    object mtDataSetNAME: TStringField
      DisplayLabel = 'Name'
      FieldName = 'NAME'
      Required = True
      Size = 100
    end
    object mtDataSetCOUNTRY: TStringField
      DisplayLabel = 'Country'
      FieldName = 'COUNTRY'
      Visible = False
      Size = 60
    end
  end
  object dsDataSet: TDataSource
    DataSet = mtDataSet
    Left = 880
    Top = 496
  end
  object mtJSON: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 816
    Top = 496
  end
  object dsJSON: TDataSource
    DataSet = mtJSON
    Left = 784
    Top = 496
  end
  object mtJSONNested: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 600
    Top = 496
    object mtJSONNestedESTADO: TStringField
      FieldName = 'ESTADO'
      Size = 100
    end
    object mtJSONNestedSIGLA: TStringField
      FieldName = 'SIGLA'
      Size = 2
    end
    object mtJSONNestedCIDADES: TDataSetField
      FieldName = 'CIDADES'
    end
    object mtJSONNestedPAISNOME: TStringField
      FieldName = 'PAIS.NOME'
      Size = 100
    end
  end
  object mtJSONNestedObject: TFDMemTable
    DataSetField = mtJSONNestedCIDADES
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 712
    Top = 496
    object mtJSONNestedObjectNOME: TStringField
      FieldName = 'NOME'
      Size = 100
    end
    object mtJSONNestedObjectCEP: TStringField
      FieldName = 'CEP'
    end
  end
  object dsJSONNested: TDataSource
    DataSet = mtJSONNested
    Left = 568
    Top = 496
  end
  object dsJSONNestedObject: TDataSource
    DataSet = mtJSONNestedObject
    Left = 680
    Top = 496
  end
end