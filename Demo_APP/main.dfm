object frm: Tfrm
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderWidth = 2
  Caption = #1057#1080#1085#1093#1088#1086#1085#1085#1086#1077' '#1086#1073#1085#1086#1074#1083#1077#1085#1080#1077' '#1094#1077#1083#1077#1074#1099#1093' '#1076#1072#1085#1085#1099#1093
  ClientHeight = 717
  ClientWidth = 767
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object pc: TPageControl
    Left = 8
    Top = 8
    Width = 753
    Height = 649
    ActivePage = p1
    HotTrack = True
    ParentShowHint = False
    ShowHint = True
    Style = tsButtons
    TabOrder = 0
    OnDrawTab = pcDrawTab
    object p1: TTabSheet
      Caption = #1048#1089#1093#1086#1076#1085#1099#1077' '#1076#1072#1085#1085#1099#1077
      ExplicitLeft = -12
      ExplicitTop = 75
      object Label1: TLabel
        Left = 25
        Top = 20
        Width = 191
        Height = 19
        Caption = #1048#1089#1093#1086#1076#1085#1099#1077' '#1076#1072#1085#1085#1099#1077' MS SQL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label4: TLabel
        Left = 25
        Top = 332
        Width = 181
        Height = 19
        Caption = #1048#1089#1093#1086#1076#1085#1099#1077' '#1076#1072#1085#1085#1099#1077' Oracle'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object gs: TStringGrid
        Left = 25
        Top = 45
        Width = 694
        Height = 220
        DragKind = dkDock
        DrawingStyle = gdsClassic
        FixedColor = cl3DLight
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goEditing, goTabs, goThumbTracking]
        TabOrder = 0
        OnSetEditText = gsSetEditText
        RowHeights = (
          24
          24
          24
          24
          24)
      end
      object RollBack: TButton
        Left = 310
        Top = 279
        Width = 130
        Height = 25
        Caption = #1054#1090#1084#1077#1085#1080#1090#1100' '#1080#1079#1084#1077#1085#1077#1085#1080#1103
        TabOrder = 1
        OnClick = RollBackClick
      end
      object DelRec: TButton
        Left = 168
        Top = 279
        Width = 130
        Height = 25
        Caption = #1059#1076#1072#1083#1080#1090#1100' '#1089#1090#1088#1086#1082#1091
        TabOrder = 2
        OnClick = DelRecClick
      end
      object AddRec: TButton
        Left = 25
        Top = 279
        Width = 130
        Height = 25
        Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1089#1090#1088#1086#1082#1091
        TabOrder = 3
        OnClick = AddRecClick
      end
      object gso: TStringGrid
        Left = 25
        Top = 357
        Width = 694
        Height = 220
        DragKind = dkDock
        DrawingStyle = gdsClassic
        FixedColor = cl3DLight
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goEditing, goTabs, goThumbTracking]
        TabOrder = 4
        OnSetEditText = gsSetEditText
        RowHeights = (
          24
          24
          24
          24
          24)
      end
      object AddRecOra: TButton
        Left = 25
        Top = 590
        Width = 130
        Height = 25
        Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1089#1090#1088#1086#1082#1091
        TabOrder = 5
        OnClick = AddRecOraClick
      end
      object DelRecOra: TButton
        Left = 167
        Top = 590
        Width = 130
        Height = 25
        Caption = #1059#1076#1072#1083#1080#1090#1100' '#1089#1090#1088#1086#1082#1091
        TabOrder = 6
        OnClick = DelRecOraClick
      end
      object RollBackOra: TButton
        Left = 310
        Top = 590
        Width = 130
        Height = 25
        Caption = #1054#1090#1084#1077#1085#1080#1090#1100' '#1080#1079#1084#1077#1085#1077#1085#1080#1103
        TabOrder = 7
        OnClick = RollBackOraClick
      end
      object SaveCng: TButton
        Left = 590
        Top = 279
        Width = 130
        Height = 25
        Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1080#1079#1084#1077#1085#1077#1085#1080#1103
        TabOrder = 8
        OnClick = SaveCngClick
      end
      object SaveCngOra: TButton
        Left = 589
        Top = 590
        Width = 130
        Height = 25
        Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1080#1079#1084#1077#1085#1077#1085#1080#1103
        TabOrder = 9
        OnClick = SaveCngOraClick
      end
    end
    object p2: TTabSheet
      Caption = #1062#1077#1083#1077#1074#1099#1077' '#1076#1072#1085#1085#1099#1077
      ImageIndex = 1
      object Label2: TLabel
        Left = 25
        Top = 20
        Width = 122
        Height = 19
        Caption = #1062#1077#1083#1077#1074#1099#1077' '#1076#1072#1085#1085#1099#1077
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object gt: TStringGrid
        Left = 25
        Top = 45
        Width = 694
        Height = 476
        DragKind = dkDock
        DrawingStyle = gdsClassic
        FixedColor = cl3DLight
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goColSizing, goTabs, goThumbTracking]
        TabOrder = 0
        RowHeights = (
          24
          22
          24
          24
          24)
      end
    end
    object p_xml2tab: TTabSheet
      Caption = #1047#1072#1075#1088#1091#1079#1082#1072' xml -> tab'
      ImageIndex = 2
      object Label3: TLabel
        Left = 80
        Top = 3
        Width = 575
        Height = 25
        Hint = #1047#1072#1075#1088#1091#1079#1082#1072' xml-'#1092#1072#1081#1083#1086#1074' '#1089' '#1087#1088#1077#1086#1073#1088#1072#1079#1086#1074#1072#1085#1080#1077#1084' '#1074' '#1090#1072#1073#1083#1080#1095#1085#1099#1081' '#1074#1080#1076
        Caption = #1047#1072#1075#1088#1091#1079#1082#1072' xml-'#1092#1072#1081#1083#1086#1074' '#1089' '#1087#1088#1077#1086#1073#1088#1072#1079#1086#1074#1072#1085#1080#1077#1084' '#1074' '#1090#1072#1073#1083#1080#1095#1085#1099#1081' '#1074#1080#1076
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -21
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object labeldir: TLabel
        Left = 33
        Top = 423
        Width = 697
        Height = 13
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object b_xml2tab_exec: TButton
        Left = 159
        Top = 464
        Width = 120
        Height = 25
        Caption = #1042#1099#1087#1086#1083#1085#1080#1090#1100' '#1079#1072#1075#1088#1091#1079#1082#1091
        Enabled = False
        TabOrder = 0
        OnClick = b_xml2tab_execClick
      end
      object b_xml2tab_takedir: TButton
        Left = 25
        Top = 464
        Width = 120
        Height = 25
        Caption = #1042#1099#1073#1088#1072#1090#1100' '#1082#1072#1090#1072#1083#1086#1075
        TabOrder = 1
        OnClick = b_xml2tab_takedirClick
      end
      object gt_xml2tab1: TStringGrid
        Left = 25
        Top = 45
        Width = 694
        Height = 366
        DragKind = dkDock
        DrawingStyle = gdsClassic
        FixedColor = cl3DLight
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goTabs, goRowSelect, goThumbTracking]
        TabOrder = 2
        RowHeights = (
          24
          24
          24
          24
          24)
      end
    end
  end
  object CloseAll: TButton
    Left = 656
    Top = 671
    Width = 75
    Height = 25
    Caption = #1042#1099#1093#1086#1076
    TabOrder = 1
    OnClick = CloseAllClick
  end
  object OpenDialog1: TOpenDialog
    Title = #1044#1083#1103' '#1074#1099#1073#1086#1088#1072' '#1101#1090#1086#1081' '#1087#1072#1087#1082#1080' '#1074#1099#1073#1077#1088#1080#1090#1077' '#1083#1102#1073#1086#1081' '#1092#1072#1081#1083' xml'
    Left = 12
    Top = 675
  end
end
