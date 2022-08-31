<!---views/upd.cfm---><!---ekran önyüz----->

<cfobject name="farmmodel" type="component" component="V16.add_options.mgogebakan_w3.coder_odev_3_farm_management.tuketim_uretim_tanim.models.farm">
  <cfset farmdata=farmmodel.get_row(GRUP_ID:"#GRUP_ID#")>  <!---burada get_row fonksiyonu "farmId" argumentine (fonksiyon parametresine) list sayfasından http ile gelen "farmId" değeri eşitleniyor ki bu sayede fonksiyon içerisindeki query tanımlı argumente göre filtrelenmiş oluyor-------->

<cf_box title="Çiftlik Hayvanı Düzenle">
    <cfform name="form1" method="post">

    <cfoutput>
        <input type="hidden" name="GRUP_ID" id="GRUP_ID" value="#farmdata.GRUP_ID#">
        <div class="form-group col col-6 col-md-6 col-sm-6 col-xs-12" id="item-GRUP_TYPE">
            <div class="col col-3 col-md-3 col-sm-3 col-xs-12">
                <label>Çiftlik Hayvanı</label>
            </div>
            <div class="col col-6 col-md-6 col-sm-6 col-xs-9">
                <input type="text" name="GRUP_TYPE" id="GRUP_TYPE" value="#farmdata.GRUP_TYPE#">
            </div>
        </div>
        <div class="form-group col col-6 col-md-6 col-sm-6 col-xs-12" id="item-TUKETILEN_MADDE_OLCU">
            <div class="col col-3 col-md-3 col-sm-3 col-xs-12">
                <label>Tüketilen Madde (Ölçü)</label>
            </div>
            <div class="col col-6 col-md-6 col-sm-6 col-xs-9">
                <input type="text" name="TUKETILEN_MADDE_OLCU" id="TUKETILEN_MADDE_OLCU" value="#farmdata.TUKETILEN_MADDE_OLCU#">
            </div>
        </div>
        <div class="form-group col col-6 col-md-6 col-sm-6 col-xs-12" id="item-URETILEN_MADDE_OLCU">
            <div class="col col-3 col-md-3 col-sm-3 col-xs-12">
                <label>Üretilen Madde (Ölçü)</label>
            </div>
            <div class="col col-6 col-md-6 col-sm-6 col-xs-9">
                <input type="text" name="URETILEN_MADDE_OLCU" id="URETILEN_MADDE_OLCU" value="#farmdata.URETILEN_MADDE_OLCU#">
            </div>
        </div>
        <div class="form-group col col-6 col-md-6 col-sm-6 col-xs-12" id="item-MUAYENE_PERIYODU">
            <div class="col col-3 col-md-3 col-sm-3 col-xs-12">
                <label>Üretilen Madde (Ölçü)</label>
            </div>
            <div class="col col-6 col-md-6 col-sm-6 col-xs-9">
                <input type="text" name="MUAYENE_PERIYODU" id="MUAYENE_PERIYODU" value="#farmdata.MUAYENE_PERIYODU#">
            </div>
        </div> 
        <div class="form-group col col-6 col-md-6 col-sm-6 col-xs-12" id="item-GELECEK_MUAYENE">
            <div class="col col-3 col-md-3 col-sm-3 col-xs-12">
                <label>Üretilen Madde (Ölçü)</label>
            </div>
            <div class="col col-6 col-md-6 col-sm-6 col-xs-9">
                <input type="text" name="GELECEK_MUAYENE" id="GELECEK_MUAYENE" value="#farmdata.GELECEK_MUAYENE#">
            </div>
        </div>     
        <cf_box_footer>
            <cf_workcube_buttons is_upd="1" add_function="kontrol()">
        </cf_box_footer>

    </cfoutput>
    </cfform>
</cf_box>

<script type="text/javascript">
    function kontrol() {
        return true;
    }
</script>

<!---http'de tanımlı değerler
<div style="margin:10px;">EVENT : 
<cfdump  var="#event#">
</div><hr>
<div style="margin:10px;">FUSEACTION : 
<cfdump  var="#fuseaction#">
</div><hr>
<div style="margin:10px;">GRUP_ID : 
<cfdump  var="#GRUP_ID#">
</div><hr>
<!---get_row fonksiyonu çıktısı farmdata---->
<div style="margin:10px;">farmDATA : 
<cfdump  var="#farmData#">
</div><hr>---->

