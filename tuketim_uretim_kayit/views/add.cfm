
        <cfquery name="get_grup_type" datasource="#dsn#">

            SELECT 
            GRUP_TYPE
            FROM catalyst_cosmetica.WORKCUBE_CODER_3_FARM_TUKETIM_URETIM_TANIM
            ORDER BY GRUP_ID

        </cfquery>

<cfparam name="attributes.GRUP_TYPE" default="">

<cfparam name="attributes.TARIH" default="#dateformat(now(),'yyyy-mm-dd')#">

<cf_box title="Yeni Kayıt">
    <cfform name="form1" method="post">
        <div class="form-group col col-6 col-md-6 col-sm-6 col-xs-12" id="item-TARIH">
            <div class="col col-3 col-md-3 col-sm-3 col-xs-12">
                <label>Tarih</label>
            </div>
            <div class="col col-6 col-md-6 col-sm-6 col-xs-9">
                <input type="date" name="TARIH" id="TARIH" value="<cfoutput>#attributes.TARIH#</cfoutput>">
            </div>
        </div>

		<div class="form-group col col-6 col-md-6 col-sm-6 col-xs-12" id="item-GRUP_TYPE">    <!----"Tümü" (Durum)---->
		    <div class="col col-3 col-md-3 col-sm-3 col-xs-12">
                <label>Çiftlik Hayvanı</label>
            </div>
            <div class="col col-6 col-md-6 col-sm-6 col-xs-9">
        	<select name="GRUP_TYPE" id="GRUP_TYPE" style="width:160px;">
				<cfoutput query="get_grup_type">
					<option value="#GRUP_TYPE#"<cfif attributes.GRUP_TYPE eq GRUP_TYPE> selected</cfif>>#GRUP_TYPE#</option>
				</cfoutput>
			</select>
            </div>
		</div>

        <div class="form-group col col-6 col-md-6 col-sm-6 col-xs-12" id="item-TUKETIM_MIKTAR">
            <div class="col col-3 col-md-3 col-sm-3 col-xs-12">
                <label>Tüketim Miktar</label>
            </div>
            <div class="col col-6 col-md-6 col-sm-6 col-xs-9">
                <input type="text" name="TUKETIM_MIKTAR" id="TUKETIM_MIKTAR">
            </div>
        </div>
        <div class="form-group col col-6 col-md-6 col-sm-6 col-xs-12" id="item-URETIM_MIKTAR">
            <div class="col col-3 col-md-3 col-sm-3 col-xs-12">
                <label>Üretim Miktar</label>
            </div>
            <div class="col col-6 col-md-6 col-sm-6 col-xs-9">
                <input type="text" name="URETIM_MIKTAR" id="URETIM_MIKTAR">
            </div>
        </div>    
        <cf_box_footer>
            <cf_workcube_buttons is_upd="0" add_function="kontrol()">
        </cf_box_footer>
    </cfform>
</cf_box>

<cf_box title="AJAX_PAGE" box_page="https://catalyst.cosmetica.com.tr/index.cfm?fuseaction=farm.tanim" refresh="1">
<div id="ajax_ornek"></div>
</cf_box>

<script type="text/javascript">


    function kontrol() {
        //if ($("#GRUP_TYPE").val() == ""){    //jquery val() method. buradaki kodlama sayesinde, çizgi film adı boş olduğunda, kaydet işlemi/butonu çalışmaz, alerti verir ve bu sayfada kalmaya devam eder
        //    alert("Çizgi film adı boş olamaz (from views/add.cfm)")
        //    $("#GRUP_TYPE").css("background-color", "#FAEBD7").focus()   //çizgi film adı boş olduğunda, css uygulanır ve focus işlemi gerçekleşir
        //    return false
        //}

        //if ($("#broadcasttime").val() == ""){   
        //    $("#broadcasttime").val("14:00")    //çizgi film adı dolu olarak fakat broadcasttime boş olarak kaydet'e basılırsa, broadcasttime değeri "14:00" olarak doldurulur. Çizgi film adı boş olarak kaydet'e basılırsa, işlem "name" koşul aşamasında false olarak return olacağı için buradaki broadcasttime koşul işlemine hiç geçilmemiş olur, dolayısıyla buradaki işlemler çalışmaz.
        //    return false
        //

        //let d = new Date()
        //if (d.getDay() == 2 || d.getDay() == 3){   
        //    alert("Salı ve Çarşamba günleri ekleme yapılamaz")
        //    return false
        //}        

        return true;
    }
</script>


