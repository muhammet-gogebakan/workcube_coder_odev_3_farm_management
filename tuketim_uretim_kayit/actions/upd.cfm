
<cfparam name="attributes.KAYIT_ID" default="">
<cfparam name="attributes.TARIH" default="">
<cfparam name="attributes.GRUP_TYPE" default="">
<cfparam name="attributes.TUKETIM_MIKTAR" default="">
<cfparam name="attributes.URETIM_MIKTAR" default="">

    <cfif len(attributes.GRUP_TYPE) eq 0>
        <script type="text/javascript">
            alert("GRUP_TYPE mevcut olmalı")
        </script>
        <cfabort>
    </cfif>

<cfobject  name="farmmodel" type="component" component="V16.add_options.mgogebakan_w3.coder_odev_3_farm_management.tuketim_uretim_kayit.models.farm">
<cfset farmmodel.upd_func(attributes.KAYIT_ID,attributes.TARIH, attributes.GRUP_TYPE, attributes.TUKETIM_MIKTAR, attributes.URETIM_MIKTAR)>      <!---veri düzenleme fonksiyonunu çalıştırma---->

<script type="text/javascript">
    document.location.href = "https://catalyst.cosmetica.com.tr/index.cfm?fuseaction=farm.kayit"
</script>