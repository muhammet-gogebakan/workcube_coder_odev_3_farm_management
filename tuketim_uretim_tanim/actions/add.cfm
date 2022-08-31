<!---actions/add.cfm----><!---listeye veri ekleme fonksiyonunu çalıştırma---->

<cfparam name="attributes.GRUP_ID" default="">
<cfparam name="attributes.GRUP_TYPE" default="">
<cfparam name="attributes.TUKETILEN_MADDE_OLCU" default="">
<cfparam name="attributes.URETILEN_MADDE_OLCU" default="">
<cfparam name="attributes.MUAYENE_PERIYODU" default="">
<cfparam name="attributes.GELECEK_MUAYENE" default="">

    <cfif len(attributes.GRUP_TYPE) eq 0>
        <script type="text/javascript">
            alert("GRUP_TYPE adı boş olamaz")
        </script>
        <cfabort>
    </cfif>

<cfobject  name="farmmodel" type="component" component="V16.add_options.mgogebakan_w3.coder_odev_3_farm_management.tuketim_uretim_tanim.models.farm">
<cfset farmmodel.add(attributes.GRUP_ID, attributes.GRUP_TYPE, attributes.TUKETILEN_MADDE_OLCU, attributes.URETILEN_MADDE_OLCU, attributes.MUAYENE_PERIYODU, attributes.GELECEK_MUAYENE)>      <!---listeye veri ekleme fonksiyonunu çalıştırma---->

<script type="text/javascript">
    document.location.href = "https://catalyst.cosmetica.com.tr/index.cfm?fuseaction=farm.tanim"
</script>


