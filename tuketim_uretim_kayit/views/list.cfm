
<style>

#page {
  border: 1px solid #ddd;
  padding: 8px;
  padding-top: 8px;
  padding-bottom: 8px;
  text-align: right;
  background-color: #008080;
  color:white;
  
  
}

.column {
  float: left;
  width: 40%;
  padding: 10px;
  height: auto; /* Should be removed. Only for demonstration */
  font-size:15px;
}

.right {
  position: absolute;
  right: 50px;
  width: auto;
  padding: 10px;
    font-size:15px;
}
</style>

<cfparam name="attributes.TARIH_BAS" default="#dateformat(dateadd('ww',-4,now()),'yyyy-mm-dd')#">
<cfparam name="attributes.TARIH_BIT" default="#dateformat(now(),'yyyy-mm-dd')#">

<!---paging----->
<cfparam name="attributes.maks_satir_sayisi" default="20"> 
<cfparam name="attributes.bulunulan_sayfa" default="1">   
<!---paging----->
      <cfparam name="attributes.dosya_adi" default="">
      
<cfobject name="farmmodel" type="component" component="V16.add_options.mgogebakan_w3.coder_odev_3_farm_management.tuketim_uretim_kayit.models.farm">
  <cfset farmdata=farmmodel.get_list(attributes.TARIH_BAS, attributes.TARIH_BIT)>
    <cf_box title="Çiftlik Tüketim Üretim Kayıt">
        <div style="float:right; margin-bottom:10px;">
          <button>
            <a class="ui-btn ui-btn-gray" style="height:35px; width:20px" href="https://catalyst.cosmetica.com.tr/index.cfm?fuseaction=farm.kayit&event=add"><div style="font-size:30px; height:40px">+</div></a>
          </button>
        </div>
      <cf_box_search plus="0">
        <cfform method="post" action="https://catalyst.cosmetica.com.tr/index.cfm?fuseaction=farm.kayit">
        <div class="form-group" id="item-TARIH">
          <label class="col col-4 col-xs-12">BAŞLANGIÇ TARİH</label>
          <div class="col col-4 col-xs-12" style="margin-right:15px">
            <input type="date" name="TARIH_BAS" id="TARIH_BAS" value="<cfoutput>#attributes.TARIH_BAS#</cfoutput>">
          </div>
          <label class="col col-4 col-xs-12">BİTİŞ TARİH</label>
          <div class="col col-4 col-xs-12" style="margin-right:15px">
            <input type="date" name="TARIH_BIT" id="TARIH_BIT" value="<cfoutput>#attributes.TARIH_BIT#</cfoutput>">
          </div>
          <input type="text" name="maks_satir_sayisi"  validate="integer" required="yes" message="Sayfalama Hatalı!" value="<cfoutput>#attributes.maks_satir_sayisi#</cfoutput>" style="width:5px;margin:15px"></td> <!----paging------>
          <cf_wrk_search_button>
        </div>
        </cfform>
        <div style="margin:20px">
<cfform method="post" action="https://catalyst.cosmetica.com.tr/index.cfm?fuseaction=farm.import">
         <label><b>Import Edilecek Excel Dosya Adı</b></label>
            <input type="text" name="dosya_adi" id="dosya_adi" value="<cfoutput>#attributes.dosya_adi#</cfoutput>">
            <input type="submit" value="Yükle" style="width:5px: hight:5px">
</cfform>
</div>
      </cf_box_search>




      <cf_grid_list>
        <thead>
          <tr>
            <th>Kayıt No</th>
            <th>Tarih</th>
            <th>Çiftlik Hayvanı</th>
            <th>Tüketilen Madde (Ölçü)</th>
            <th>Tüketim Miktar</th>
            <th>Üretilen Madde (Ölçü)</th>
            <th>Üretim Miktar</th>            
            <th style="text-align:center" >(düzenle)</th>
          </tr>
        </thead>
        <tbody>
          <cfoutput query="farmdata" startrow="#((attributes.bulunulan_sayfa * attributes.maks_satir_sayisi)-attributes.maks_satir_sayisi)+1#" maxrows="#attributes.maks_satir_sayisi#">
            <tr>
            <td>#KAYIT_ID#</td>
            <td>#TARIH#</td>
            <td>#GRUP_TYPE#</td>
            <td>#TUKETILEN_MADDE_OLCU#</td>
            <td>#TUKETIM_MIKTAR#</td>
            <td>#URETILEN_MADDE_OLCU#</td>
            <td>#URETIM_MIKTAR#</td>            
            <td>
              <a href="https://catalyst.cosmetica.com.tr/index.cfm?fuseaction=farm.kayit&event=upd&KAYIT_ID=#KAYIT_ID#"><i class="fa fa-pencil"></i></a> <!---UPDATE sayfasında gerekli olan KAYIT_ID bilgisine ulaşmak için, görüntülenecek tabloda ihtiyaç olmadığı için belirtilmeyen KAYIT_ID, query fonksiyonunda (get_list) SELECT listesine eklendi.---->
            </td>
            </tr>
          </cfoutput>
        </tbody>
      </cf_grid_list>
      
    </cf_box>

<!---paging----->

<cfset sayfa='#getPageContext().getRequest().getScheme()#://#cgi.server_name##cgi.script_name#?#cgi.query_string#'>  <!---mevcut sayfanın url'sini tanımlama--->

<cfset bulunulan_page = #attributes.bulunulan_sayfa#>
<cfset satir_count = #queryRecordCount(farmdata)#>
<cfset max_page = satir_count/#attributes.maks_satir_sayisi#>

<div class="row" style="margin-left:50px;">
  <cfoutput>
    <div class="column">
      <cfif sayfa=="https://catalyst.cosmetica.com.tr/index.cfm?fuseaction=farm.kayit">
        <button type="button" hidden>Geri</button>
      <cfelseif #attributes.bulunulan_sayfa# eq 1>
        <button type="button" hidden>Geri</button>
      <cfelse>
        <a href="https://catalyst.cosmetica.com.tr/index.cfm?fuseaction=farm.kayit&TARIH_BAS=#attributes.TARIH_BAS#&TARIH_BIT=#attributes.TARIH_BIT#&maks_satir_sayisi=#attributes.maks_satir_sayisi#&bulunulan_sayfa=#attributes.bulunulan_sayfa-1#">
        <button id="page">Geri</button></a>
      </cfif>     
    </div>

    <div class="column, right">
      <cfif bulunulan_page GT max_page>
        <button type="button" hidden>İleri</button>
      <cfelse>  
        <a href="https://catalyst.cosmetica.com.tr/index.cfm?fuseaction=farm.kayit&TARIH_BAS=#attributes.TARIH_BAS#&TARIH_BIT=#attributes.TARIH_BIT#&maks_satir_sayisi=#attributes.maks_satir_sayisi#&bulunulan_sayfa=#attributes.bulunulan_sayfa+1#">
        <button id="page">İleri</button></a>
      </cfif>
    </div>
  </cfoutput>
</div>

<div style="text-align:center; font-size:15px;">
<cfoutput>Sayfa #bulunulan_page#/#ceiling(max_page)#
</cfoutput>
</div>

<!---paging----->

    <div style="margin-left:20px" >
    <button type="button" class="btn btn-primary" style="background-color:white; margin:10px; border-style:solid;border-width: 3px;border-color:#F08080;"><a href="https://catalyst.cosmetica.com.tr/index.cfm?fuseaction=farm.tanim" style="color:#F08080">Çiftlik Tüketim Üretim Tanım</a></button>
    <button type="button" class="btn btn-primary" style="background-color:white; margin:10px; border-style:solid;border-width: 3px;border-color:#F08080;"><a href="https://catalyst.cosmetica.com.tr/index.cfm?fuseaction=farm.kayit" style="color:#F08080">Çiftlik Tüketim Üretim Kayıt</a></button>
    <button type="button" class="btn btn-primary" style="background-color:white; margin:10px; border-style:solid;border-width: 3px;border-color:#F08080;"><a href="https://catalyst.cosmetica.com.tr/index.cfm?fuseaction=farm.dashboard" style="color:#F08080">Çiftlik Dashboard</a></button>
    </div>




