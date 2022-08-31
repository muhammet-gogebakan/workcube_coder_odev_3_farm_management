<!---views/upd.cfm---><!---ekran önyüz----->

        <cfquery name="get_grup_type" datasource="#dsn#">

            SELECT 
            GRUP_TYPE
            FROM catalyst_cosmetica.WORKCUBE_CODER_3_FARM_TUKETIM_URETIM_TANIM
            ORDER BY GRUP_ID

        </cfquery>

<cfobject name="farmmodel" type="component" component="V16.add_options.mgogebakan_w3.coder_odev_3_farm_management.tuketim_uretim_kayit.models.farm">
  <cfset farmdata=farmmodel.get_row(KAYIT_ID:"#KAYIT_ID#")>  <!---burada get_row fonksiyonu "farmId" argumentine (fonksiyon parametresine) list sayfasından http ile gelen "farmId" değeri eşitleniyor ki bu sayede fonksiyon içerisindeki query tanımlı argumente göre filtrelenmiş oluyor-------->

<cf_box title="Kayıt Düzenle">
    <cfform name="form1" method="post">
    <cfoutput>
        <input type="hidden" name="KAYIT_ID" id="KAYIT_ID" value="#farmdata.KAYIT_ID#">
        <div class="form-group col col-6 col-md-6 col-sm-6 col-xs-12" id="item-TARIH">
            <div class="col col-3 col-md-3 col-sm-3 col-xs-12">
                <label>TARIH</label>
            </div>
            <div class="col col-6 col-md-6 col-sm-6 col-xs-9">
                <input type="date" name="TARIH" id="TARIH" value="#farmdata.TARIH#">
            </div>
        </div>
        <div class="form-group col col-6 col-md-6 col-sm-6 col-xs-12" id="item-GRUP_TYPE">
            <div class="col col-3 col-md-3 col-sm-3 col-xs-12">
                <label>Çiftlik Hayvanı</label>
            </div>
            <div class="col col-6 col-md-6 col-sm-6 col-xs-9">
                <input type="text" name="GRUP_TYPE" id="GRUP_TYPE" value="#farmdata.GRUP_TYPE#">
            </div>
        </div>
        <div class="form-group col col-6 col-md-6 col-sm-6 col-xs-12" id="item-TUKETIM_MIKTAR">
            <div class="col col-3 col-md-3 col-sm-3 col-xs-12">
                <label>Tüketim Miktar</label>
            </div>
            <div class="col col-6 col-md-6 col-sm-6 col-xs-9">
                <input type="text" name="TUKETIM_MIKTAR" id="TUKETIM_MIKTAR" value="#farmdata.TUKETIM_MIKTAR#">
            </div>
        </div>
        <div class="form-group col col-6 col-md-6 col-sm-6 col-xs-12" id="item-URETIM_MIKTAR">
            <div class="col col-3 col-md-3 col-sm-3 col-xs-12">
                <label>Üretim Miktar</label>
            </div>
            <div class="col col-6 col-md-6 col-sm-6 col-xs-9">
                <input type="text" name="URETIM_MIKTAR" id="URETIM_MIKTAR" value="#farmdata.URETIM_MIKTAR#">
            </div>
        </div>    
        <cf_box_footer>
            <cf_workcube_buttons is_upd="1" add_function="kontrol()">
        </cf_box_footer>

    </cfoutput>
    </cfform>
</cf_box>

<cf_box title="AJAX_PAGE" box_page="https://catalyst.cosmetica.com.tr/index.cfm?fuseaction=farm.tanim" refresh="1">
<div id="ajax_ornek"></div>
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
<div style="margin:10px;">KAYIT_ID : 
<cfdump  var="#KAYIT_ID#">
</div><hr>
<!---get_row fonksiyonu çıktısı farmdata---->
<div style="margin:10px;">farmDATA : 
<cfdump  var="#farmData#">
</div><hr>---->

