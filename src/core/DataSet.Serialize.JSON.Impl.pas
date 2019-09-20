﻿unit DataSet.Serialize.JSON.Impl;

interface

uses System.JSON, Data.DB, Language.Types, Providers.DataSet.Serialize, System.StrUtils,
  System.SysUtils;

type
  TJSONSerialize = class
  private
    FMerging: Boolean;
    FJSONObject: TJSONObject;
    FJSONArray: TJSONArray;
    FOwns: Boolean;
    /// <summary>
    ///   Delete all records from dataset.
    /// </summary>
    /// <param name="ADataSet">
    ///   DataSet that will be cleared.
    /// </param>
    procedure ClearDataSet(const ADataSet: TDataSet);
    /// <summary>
    ///   Load a field of type blob with the value of a JSON.
    /// </summary>
    /// <param name="AField">
    ///   It refers to the field that you want to be loaded with the JSONValue.
    /// </param>
    /// <param name="AJSONValue">
    ///   It refers to the value that is assigned to the field.
    /// </param>
    procedure LoadBlobFieldFromStream(const AField: TField; const AJSONValue: TJSONValue);
    /// <summary>
    ///   Loads the fields of a DataSet based on a JSONArray.
    /// </summary>
    /// <param name="AJSONArray">
    ///   JSONArray with the DataSet structure.
    /// </param>
    /// <param name="ADataSet">
    ///   Refers to the DataSet that will be configured.
    /// </param>
    /// <remarks>
    ///   The DataSet can not have predefined fields.
    ///   The DataSet can not be active.
    ///   To convert a structure only JSONArray is allowed.
    /// </remarks>
    procedure JSONArrayToStructure(const AJSONArray: TJSONArray; const ADataSet: TDataSet);
    /// <summary>
    ///   Loads a DataSet with a JSONObject.
    /// </summary>
    /// <param name="AJSONObject">
    ///   Refers to the JSON in with the data that must be loaded in the DataSet.
    /// </param>
    /// <param name="ADataSet">
    ///   Refers to the DataSet which must be loaded with the JSON data.
    /// </param>
    /// <param name="AMerging">
    ///   Indicates whether to include or change the DataSet record.
    /// </param>
    procedure JSONObjectToDataSet(const AJSONObject: TJSONObject; const ADataSet: TDataSet; const AMerging: Boolean);
    /// <summary>
    ///   Loads a DataSet with a JSONOValue.
    /// </summary>
    /// <param name="AJSONValue">
    ///   Refers to the JSON value that must be loaded in the DataSet.
    /// </param>
    /// <param name="ADataSet">
    ///   Refers to the DataSet which must be loaded with the JSON value.
    /// </param>
    procedure JSONValueToDataSet(const AJSONValue: TJSONValue; const ADataSet: TDataSet);
    /// <summary>
    ///   Loads a DataSet with a JSONArray.
    /// </summary>
    /// <param name="AJSONArray">
    ///   Refers to the JSON in with the data that must be loaded in the DataSet.
    /// </param>
    /// <param name="ADataSet">
    ///   Refers to the DataSet which must be loaded with the JSON data.
    /// </param>
    procedure JSONArrayToDataSet(const AJSONArray: TJSONArray; const ADataSet: TDataSet);
    /// <summary>
    ///   Creates a JSON informing the required field.
    /// </summary>
    /// <param name="AFieldName">
    ///   Field name in the DataSet.
    /// </param>
    /// <param name="ADisplayLabel">
    ///   Formatted field name.
    /// </param>
    /// <param name="ALang">
    ///   Language used to mount messages.
    /// </param>
    /// <returns>
    ///   Returns a JSON with the message and field name.
    /// </returns>
    function AddFieldNotFound(const AFieldName, ADisplayLabel: string; const ALang: TLanguageType = enUS): TJSONObject;
    /// <summary>
    ///   Load field structure.
    /// </summary>
    /// <param name="AJSONValue">
    ///   JSON with field data.
    /// </param>
    /// <returns>
    ///   Record of field structure.
    /// </returns>
    function LoadFieldStructure(const AJSONValue: TJSONValue): TFieldStructure;
    /// <returns>
    ///   The key fields name of the ADataSet parameter.
    /// </returns>
    function GetKeyFieldsDataSet(const ADataSet: TDataSet): string;
    /// <returns>
    ///   The key values of the ADataSet parameter.
    /// </returns>
    function GetKeyValuesDataSet(const ADataSet: TDataSet; const AJSONObject: TJSONObject): TKeyValues;
    /// <summary>
    ///   Load the fields into the dataset.
    /// </summary>
    procedure LoadFieldsFromJSON(const ADataSet: TDataSet; const AJSONObject: TJSONObject);
	public
    /// <summary>
    ///   Responsible for creating a new isntância of TDataSetSerialize class.
    /// </summary>
    /// <param name="AJSONArray">
    ///   Refers to the JSON in with the data that must be loaded in the DataSet.
    /// </param>
    constructor Create(const AJSONArray: TJSONArray; const AOwns: Boolean); overload;
    /// <summary>
    ///   Responsible for creating a new isntância of TDataSetSerialize class.
    /// </summary>
    /// <param name="AJSONObject">
    ///   Refers to the JSON in with the data that must be loaded in the DataSet.
    /// </param>
    constructor Create(const AJSONObject: TJSONObject; const AOwns: Boolean); overload;
    /// <summary>
    ///   Loads fields from a DataSet based on JSON.
    /// </summary>
    /// <param name="ADataSet">
    ///   Refers to the DataSet to which you want to load the structure.
    /// </param>
    procedure LoadStructure(const ADataSet: TDataSet);
    /// <summary>
    ///   Responsible for validating whether JSON has all the necessary information for a particular DataSet.
    /// </summary>
    /// <param name="ADataSet">
    ///   Refers to the DataSet that will be loaded with JSON.
    /// </param>
    /// <param name="ALang">
    ///   Language used to mount messages.
    /// </param>
    /// <returns>
    ///   Returns a JSONArray with the fields that were not informed.
    /// </returns>
    /// <remarks>
    ///   Walk the DataSet fields by checking the required property.
    ///   Uses the DisplayLabel property to mount the message.
    /// </remarks>
    function Validate(const ADataSet: TDataSet; const ALang: TLanguageType = enUS): TJSONArray;
    /// <summary>
    ///   Runs the merge between the record of DataSet and JSONObject.
    /// </summary>
    /// <param name="ADataSet">
    ///   Refers to the DataSet that you want to merge with the JSON object.
    /// </param>
    procedure Merge(const ADataSet: TDataSet);
    /// <summary>
    ///   Loads the DataSet with JSON content.
    /// </summary>
    /// <param name="ADataSet">
    ///   Refers to the DataSet you want to load.
    /// </param>
    procedure ToDataSet(const ADataSet: TDataSet);
    /// <summary>
    ///   Responsible for destroying the TJSONSerialize class instance.
    /// </summary>
    /// <remarks>
    ///   If owner of the JSON, destroys the same.
    /// </remarks>
    destructor Destroy; override;
  end;

implementation

uses System.Classes, System.NetEncoding, System.TypInfo, System.DateUtils, Providers.DataSet.Serialize.Constants,
  System.Generics.Collections, System.Variants, UpdatedStatus.Types,
  FireDAC.Comp.Client;

{ TJSONSerialize }

procedure TJSONSerialize.JSONObjectToDataSet(const AJSONObject: TJSONObject; const ADataSet: TDataSet; const AMerging: Boolean);
var
  LField: TField;
  LJSONValue: TJSONValue;
  LNestedDataSet: TDataSet;
  LBooleanValue: Boolean;
  LDataSetDetails: TList<TDataSet>;
  LObjectState: string;
begin
  if (not Assigned(AJSONObject)) or (not Assigned(ADataSet)) then
    Exit;
    
  if not(ADataSet.Active) then
  begin
    if not(ADataSet is TFDMemTable)  then
      Exit;
    if ADataSet.FieldCount = 0 then
      LoadFieldsFromJSON(ADataSet, AJSONObject);
    ADataSet.Open;
  end;

  if AJSONObject.TryGetValue(OBJECT_STATE, LObjectState) then
  begin
    if TUpdateStatus.usInserted.ToString.Equals(LObjectState) then
      ADataSet.Append
    else if not TUpdateStatus.usUnmodified.ToString.Equals(LObjectState) then
    begin
      if not ADataSet.Locate(GetKeyFieldsDataSet(ADataSet), VarArrayOf(GetKeyValuesDataSet(ADataSet, AJSONObject)), []) then
        Exit;
      if TUpdateStatus.usModified.ToString.Equals(LObjectState) then
        ADataSet.Edit
      else if TUpdateStatus.usDeleted.ToString.Equals(LObjectState) then
      begin
        ADataSet.Delete;
        Exit;
      end;
    end;
  end
  else if AMerging then
    ADataSet.Edit
  else
    ADataSet.Append;
    
  if (ADataSet.State in dsEditModes) then
  begin
    for LField in ADataSet.Fields do
    begin
      if LField.ReadOnly then
        Continue;
      if not (AJSONObject.TryGetValue(LField.FieldName, LJSONValue) or AJSONObject.TryGetValue(LowerCase(LField.FieldName), LJSONValue)) then
        Continue;
      if LJSONValue is TJSONNull then
      begin
        LField.Clear;
        Continue;
      end;
      case LField.DataType of
        TFieldType.ftBoolean:
          if LJSONValue.TryGetValue<Boolean>(LBooleanValue) then
            LField.AsBoolean := LBooleanValue;
        TFieldType.ftInteger, TFieldType.ftSmallint, TFieldType.ftShortint, TFieldType.ftLongWord:
          LField.AsInteger := StrToIntDef(LJSONValue.Value, 0);
        TFieldType.ftLargeint, TFieldType.ftAutoInc:
          LField.AsLargeInt := StrToInt64Def(LJSONValue.Value, 0);
        TFieldType.ftCurrency:
          LField.AsCurrency := StrToCurr(LJSONValue.Value);
        TFieldType.ftFloat, TFieldType.ftFMTBcd, TFieldType.ftBCD, TFieldType.ftSingle:
          LField.AsFloat := StrToFloat(LJSONValue.Value);
        TFieldType.ftString, TFieldType.ftWideString, TFieldType.ftMemo, TFieldType.ftWideMemo:
          LField.AsString := LJSONValue.Value;
        TFieldType.ftDate, TFieldType.ftTimeStamp, TFieldType.ftDateTime, TFieldType.ftTime:
          LField.AsDateTime := ISO8601ToDate(LJSONValue.Value);
        TFieldType.ftDataSet:
          begin
            LNestedDataSet := TDataSetField(LField).NestedDataSet;
            if LJSONValue is TJSONObject then
              JSONObjectToDataSet(LJSONValue as TJSONObject, LNestedDataSet, False)
            else if LJSONValue is TJSONArray then
            begin
              ClearDataSet(LNestedDataSet);
              JSONArrayToDataSet(LJSONValue as TJSONArray, LNestedDataSet);
            end;
          end;
        TFieldType.ftGraphic, TFieldType.ftBlob, TFieldType.ftStream:
          LoadBlobFieldFromStream(LField, LJSONValue);
        else
          raise EDataSetSerializeException.CreateFmt(FIELD_TYPE_NOT_FOUND, [LField.FieldName]);
      end;
    end;
    ADataSet.Post;
  end;  
  LDataSetDetails := TList<TDataSet>.Create;
  try
    ADataSet.GetDetailDataSets(LDataSetDetails);
    for LNestedDataSet in LDataSetDetails do
    begin
      if not AJSONObject.TryGetValue(LowerCase(TDataSetSerializeUtils.FormatDataSetName(LNestedDataSet.Name)), LJSONValue) then
        Continue;
      if LJSONValue is TJSONNull then
        Continue;
      if LJSONValue is TJSONObject then
        JSONObjectToDataSet(LJSONValue as TJSONObject, LNestedDataSet, False)
      else if LJSONValue is TJSONArray then
        JSONArrayToDataSet(LJSONValue as TJSONArray, LNestedDataSet);
    end;
  finally
    LDataSetDetails.Free;
  end;
end;

procedure TJSONSerialize.JSONValueToDataSet(const AJSONValue: TJSONValue; const ADataSet: TDataSet);
begin
  if ADataSet.Fields.Count <> 1 then
    raise EDataSetSerializeException.Create(Format(INVALID_FIELD_COUNT, [ADataSet.Name]));
  ADataSet.Append;
  ADataSet.Fields.Fields[0].AsString := AJSONValue.Value;
  ADataSet.Post;
end;

procedure TJSONSerialize.ToDataSet(const ADataSet: TDataSet);
begin
  if Assigned(FJSONObject) then
    JSONObjectToDataSet(FJSONObject, ADataSet, FMerging)
  else if Assigned(FJSONArray) then
    JSONArrayToDataSet(FJSONArray, ADataSet)
  else
    raise EDataSetSerializeException.Create(JSON_NOT_DIFINED);
end;

function TJSONSerialize.Validate(const ADataSet: TDataSet; const ALang: TLanguageType = enUS): TJSONArray;
var
  LField: TField;
  LJSONValue: string;
begin
  if not Assigned(FJSONObject) then
    raise EDataSetSerializeException.Create(JSON_NOT_DIFINED);
  if ADataSet.Fields.Count = 0 then
    raise EDataSetSerializeException.Create(DATASET_HAS_NO_DEFINED_FIELDS);
  Result := TJSONArray.Create();
  for LField in ADataSet.Fields do
    if LField.Required then
    begin
      if FJSONObject.TryGetValue(LField.FieldName, LJSONValue) or FJSONObject.TryGetValue(LowerCase(LField.FieldName), LJSONValue) then
      begin
        if LJSONValue.Trim.IsEmpty then
          Result.AddElement(AddFieldNotFound(LField.FieldName, LField.DisplayLabel, ALang));
      end
      else if LField.IsNull then
        Result.AddElement(AddFieldNotFound(LField.FieldName, LField.DisplayLabel, ALang));
    end;
end;

procedure TJSONSerialize.LoadBlobFieldFromStream(const AField: TField; const AJSONValue: TJSONValue);
var
  LStringStream: TStringStream;
  LMemoryStream: TMemoryStream;
begin
  LStringStream := TStringStream.Create((AJSONValue as TJSONString).Value);
  try
    LStringStream.Position := 0;
    LMemoryStream := TMemoryStream.Create;
    try
      TNetEncoding.Base64.Decode(LStringStream, LMemoryStream);
      TBlobField(AField).LoadFromStream(LMemoryStream);
    finally
      LMemoryStream.Free;
    end;
  finally
    LStringStream.Free;
  end;
end;

procedure TJSONSerialize.LoadFieldsFromJSON(const ADataSet: TDataSet; const AJSONObject: TJSONObject);
var
  JSONPair: TJSONPair;
begin
  for JSONPair in AJSONObject do
  begin
    with ADataSet.FieldDefs.AddFieldDef do
    begin
      Name := JSONPair.JsonString.Value;
      DataType := ftString;
      Size := 4096;
    end;
  end;
end;

function TJSONSerialize.LoadFieldStructure(const AJSONValue: TJSONValue): TFieldStructure;
var
  LStrTemp: string;
  LIntTemp: Integer;
  LBoolTemp: Boolean;
begin
  if AJSONValue.TryGetValue<string>('DataType', LStrTemp) then
    Result.FieldType := TFieldType(GetEnumValue(TypeInfo(TFieldType), LStrTemp))
  else
    raise EDataSetSerializeException.CreateFmt('Attribute %s not found in json!', ['DataType']);

  if AJSONValue.TryGetValue<string>('FieldName', LStrTemp) then
    Result.FieldName := LStrTemp
  else
    raise EDataSetSerializeException.CreateFmt('Attribute %s not found in json!', ['FieldName']);

  if AJSONValue.TryGetValue<Integer>('Size', LIntTemp) then
    Result.Size := LIntTemp;

  if AJSONValue.TryGetValue<Integer>('Precision', LIntTemp) then
    Result.Precision := LIntTemp;

  if AJSONValue.TryGetValue<string>('Origin', LStrTemp) then
    Result.Origin := LStrTemp;

  if AJSONValue.TryGetValue<string>('DisplayLabel', LStrTemp) then
    Result.DisplayLabel := LStrTemp;

  if AJSONValue.TryGetValue<Boolean>('Key', LBoolTemp) then
    Result.Key := LBoolTemp;

  if AJSONValue.TryGetValue<Boolean>('Required', LBoolTemp) then
    Result.Required := LBoolTemp;

  if AJSONValue.TryGetValue<Boolean>('Visible', LBoolTemp) then
    Result.Visible := LBoolTemp;

  if AJSONValue.TryGetValue<Boolean>('ReadOnly', LBoolTemp) then
    Result.ReadOnly := LBoolTemp;

  if AJSONValue.TryGetValue<string>('AutoGenerateValue', LStrTemp) then
    Result.AutoGenerateValue := TAutoRefreshFlag(GetEnumValue(TypeInfo(TAutoRefreshFlag), LStrTemp));
end;

procedure TJSONSerialize.LoadStructure(const ADataSet: TDataSet);
begin
  if Assigned(FJSONObject) then
    raise EDataSetSerializeException.Create(TO_CONVERT_STRUCTURE_ONLY_JSON_ARRAY_ALLOWED)
  else if Assigned(FJSONArray) then
    JSONArrayToStructure(FJSONArray, ADataSet)
  else
    raise EDataSetSerializeException.Create(JSON_NOT_DIFINED);
end;

function TJSONSerialize.AddFieldNotFound(const AFieldName, ADisplayLabel: string; const ALang: TLanguageType = enUS): TJSONObject;
begin
  Result := TJSONObject.Create;
  Result.AddPair(TJSONPair.Create('field', AFieldName));
  case ALang of
    ptBR:
      Result.AddPair(TJSONPair.Create('error', ADisplayLabel + ' não foi informado(a)'));
    else
      Result.AddPair(TJSONPair.Create('error', ADisplayLabel + ' not informed'));
  end;
end;

procedure TJSONSerialize.ClearDataSet(const ADataSet: TDataSet);
begin
  ADataSet.First;
  while not ADataSet.Eof do
    ADataSet.Delete;
end;

constructor TJSONSerialize.Create(const AJSONObject: TJSONObject; const AOwns: Boolean);
begin
  FOwns := AOwns;
  FJSONObject := AJSONObject;
end;

constructor TJSONSerialize.Create(const AJSONArray: TJSONArray; const AOwns: Boolean);
begin
  FOwns := AOwns;
  FJSONArray := AJSONArray;
end;

procedure TJSONSerialize.JSONArrayToDataSet(const AJSONArray: TJSONArray; const ADataSet: TDataSet);
var
  LJSONValue: TJSONValue;
begin
  if (not Assigned(AJSONArray)) or (not Assigned(ADataSet)) then
    Exit;
  for LJSONValue in AJSONArray do
  begin
    if (LJSONValue is TJSONArray) then
      JSONArrayToDataSet(LJSONValue as TJSONArray, ADataSet)
    else if (LJSONValue is TJSONObject) then
      JSONObjectToDataSet(LJSONValue as TJSONObject, ADataSet, False)
    else
      JSONValueToDataSet(LJSONValue, ADataSet);
  end;
  if ADataSet.Active then
    ADataSet.First;
end;

procedure TJSONSerialize.Merge(const ADataSet: TDataSet);
begin
  FMerging := True;
  try
    ToDataSet(ADataSet);
  finally
    FMerging := False;
  end;
end;

procedure TJSONSerialize.JSONArrayToStructure(const AJSONArray: TJSONArray; const ADataSet: TDataSet);
var
  LJSONValue: TJSONValue;
begin
  if ADataSet.Active then
    raise EDataSetSerializeException.Create(DATASET_ACTIVATED);
  if ADataSet.FieldCount > 0 then
    raise EDataSetSerializeException.Create(PREDEFINED_FIELDS);
  for LJSONValue in AJSONArray do
    TDataSetSerializeUtils.NewDataSetField(ADataSet, LoadFieldStructure(LJSONValue));
end;

destructor TJSONSerialize.Destroy;
begin
  if Assigned(FJSONObject) and FOwns then
    FJSONObject.Free;
  if Assigned(FJSONArray) and FOwns then
    FJSONArray.Free;
  FJSONObject := nil;
  FJSONArray := nil;
  inherited Destroy;
end;

function TJSONSerialize.GetKeyFieldsDataSet(const ADataSet: TDataSet): string;
var
  LField: TField;
begin
  Result := EmptyStr;
  for LField in ADataSet.Fields do
    if pfInKey in LField.ProviderFlags then
      Result := Result + IfThen(Result.Trim.IsEmpty, EmptyStr, ';') + LField.FieldName;
end;

function TJSONSerialize.GetKeyValuesDataSet(const ADataSet: TDataSet; const AJSONObject: TJSONObject): TKeyValues;
var
  LField: TField;
  LKeyValue: string;
begin
  for LField in ADataSet.Fields do
    if pfInKey in LField.ProviderFlags then
    begin
      if not (AJSONObject.TryGetValue(LowerCase(LField.FieldName), LKeyValue) or AJSONObject.TryGetValue(LField.FieldName, LKeyValue)) then
        Continue;
      SetLength(Result, Length(Result) + 1);
      Result[Pred(Length(Result))] := LKeyValue;
    end;
end;

end.
