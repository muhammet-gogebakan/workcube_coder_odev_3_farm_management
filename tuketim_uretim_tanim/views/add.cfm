<!---views/add.cfm---><!---ekran önyüz----->
<cfparam name="attributes.TUKETILEN_MADDE_OLCU" default="">
<cf_box title="Yeni Çiftlik Hayvanı">
    <cfform name="form1" method="post">
        <!---<div class="form-group col col-6 col-md-6 col-sm-6 col-xs-12" id="item-GRUP_ID">
            <div class="col col-3 col-md-3 col-sm-3 col-xs-12">
                <label>Sıra No</label>
            </div>
            <div class="col col-6 col-md-6 col-sm-6 col-xs-9">
                <input type="text" name="GRUP_ID" id="GRUP_ID">
            </div>
        </div>---->
        <div class="form-group col col-6 col-md-6 col-sm-6 col-xs-12" id="item-GRUP_TYPE">
            <div class="col col-3 col-md-3 col-sm-3 col-xs-12">
                <label>Çiftlik Hayvanı</label>
            </div>
            <div class="col col-6 col-md-6 col-sm-6 col-xs-9">
                <input type="text" name="GRUP_TYPE" id="GRUP_TYPE">
            </div>
        </div>
        <div class="form-group col col-6 col-md-6 col-sm-6 col-xs-12" id="item-TUKETILEN_MADDE_OLCU">
            <div class="col col-3 col-md-3 col-sm-3 col-xs-12">
                <label>Tüketilen Madde (Ölçü)</label>
            </div>
            <div class="col col-6 col-md-6 col-sm-6 col-xs-9">
                <input type="text" name="TUKETILEN_MADDE_OLCU" id="TUKETILEN_MADDE_OLCU" value='<cfoutput>#attributes.TUKETILEN_MADDE_OLCU#</cfoutput>'>
            </div>
        </div>
        <div class="form-group col col-6 col-md-6 col-sm-6 col-xs-12" id="item-URETILEN_MADDE_OLCU">
            <div class="col col-3 col-md-3 col-sm-3 col-xs-12">
                <label>Üretilen Madde (Ölçü)</label>
            </div>
            <div class="col col-6 col-md-6 col-sm-6 col-xs-9">
                <input type="text" name="URETILEN_MADDE_OLCU" id="URETILEN_MADDE_OLCU">
            </div>
        </div>    
        <div class="form-group col col-6 col-md-6 col-sm-6 col-xs-12" id="item-MUAYENE_PERIYODU">
            <div class="col col-3 col-md-3 col-sm-3 col-xs-12">
                <label>Muayene Periyodu</label>
            </div>
            <div class="col col-6 col-md-6 col-sm-6 col-xs-9">
                <input type="text" name="MUAYENE_PERIYODU" id="MUAYENE_PERIYODU">
            </div>
        </div> 
        <div class="form-group col col-6 col-md-6 col-sm-6 col-xs-12" id="item-GELECEK_MUAYENE">
            <div class="col col-3 col-md-3 col-sm-3 col-xs-12">
                <label>Gelecek Muayene</label>
            </div>
            <div class="col col-6 col-md-6 col-sm-6 col-xs-9">
                <input type="text" name="GELECEK_MUAYENE" id="GELECEK_MUAYENE">
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


