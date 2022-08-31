
<cfparam name="attributes.TARIH_BAS" default="#dateformat(dateadd('ww',-4,now()),'yyyy-mm-dd')#">
<cfparam name="attributes.TARIH_BIT" default="#dateformat(now(),'yyyy-mm-dd')#">

<cfobject name="farmmodel" type="component" component="V16.add_options.mgogebakan_w3.coder_odev_3_farm_management.tuketim_uretim_kayit.models.farm">
  <cfset farmdata=farmmodel.kayit_list(attributes.TARIH_BAS, attributes.TARIH_BIT)>

    <cf_box title="Çiftlik Tüketim Üretim Tablosu">
      <cf_box_search>
        <cfform>
        <div class="form-group" id="item-TARIH">
          <label class="col col-4 col-xs-12">BAŞLANGIÇ TARİH</label>
          <div class="col col-4 col-xs-12" style="margin-right:15px">
            <input type="date" name="TARIH_BAS" id="TARIH_BAS" value="<cfoutput>#attributes.TARIH_BAS#</cfoutput>">
          </div>
          <label class="col col-4 col-xs-12">BİTİŞ TARİH</label>
          <div class="col col-4 col-xs-12" style="margin-right:15px">
            <input type="date" name="TARIH_BIT" id="TARIH_BIT" value="<cfoutput>#attributes.TARIH_BIT#</cfoutput>">
          </div>
          <cf_wrk_search_button>
        </div>
        </cfform>
      </cf_box_search>

      <cf_grid_list>
        <thead>
          <tr>
            <th>Çiftlik Hayvanı</th>
            <th>Tüketilen Madde (Ölçü)</th>
            <th><b>Toplam Tüketim Miktar</b></th>
            <th>Üretilen Madde (Ölçü)</th>
            <th><b>Toplam Üretim Miktar</b></th>    
            <th>Muayene Periyodu</th>
            <th>Gelecek Muayene</th>        
          </tr>
        </thead>
        <tbody>
          <cfoutput query="farmdata">
            <tr>
            <td>#GRUP_TYPE#</td>
            <td>#TUKETILEN_MADDE_OLCU#</td>
            <td>#TUKETIM_MIKTAR#</td>
            <td>#URETILEN_MADDE_OLCU#</td>
            <td>#URETIM_MIKTAR#</td>   
            <td>#MUAYENE_PERIYODU#</td>
            <td>#GELECEK_MUAYENE#</td>        
            </tr>
          </cfoutput>
        </tbody>
      </cf_grid_list>
      
    </cf_box>
    <cfoutput>#farmdata.TUKETIM_MIKTAR#
    </cfoutput>
    

<cfobject name="farmgrup" type="component" component="V16.add_options.mgogebakan_w3.coder_odev_3_farm_management.tuketim_uretim_kayit.models.farm">
  <cfset farminek=farmgrup.tuketim_uretim(attributes.TARIH_BAS, attributes.TARIH_BIT,"İnekler" )>
  <cfset farmkeci=farmgrup.tuketim_uretim(attributes.TARIH_BAS, attributes.TARIH_BIT, "Keçiler" )>
  <cfset farmkedi=farmgrup.tuketim_uretim(attributes.TARIH_BAS, attributes.TARIH_BIT, "Kediler" )>
  <cfset farmkoyun=farmgrup.tuketim_uretim(attributes.TARIH_BAS, attributes.TARIH_BIT, "Koyunlar" )>
  <cfset farmkopek=farmgrup.tuketim_uretim(attributes.TARIH_BAS, attributes.TARIH_BIT, "Köpekler" )>
  <cfset farmtavuk=farmgrup.tuketim_uretim(attributes.TARIH_BAS, attributes.TARIH_BIT, "Tavuklar" )>


<cfchart format="png" chartWidth="450" chartHeight="300" pieSliceStyle="solid">
    <cfchartseries type="pie" serieslabel="Çiftlik Hayvanları Tüketim Miktarı">
        <cfoutput><cfchartdata item="İnekler" value="#farminek.TUKETIM_MIKTAR#"></cfoutput>
        <cfoutput><cfchartdata item="Keçiler" value="#farmkeci.TUKETIM_MIKTAR#"></cfoutput>
        <cfoutput><cfchartdata item="Kediler" value="#farmkedi.TUKETIM_MIKTAR#"></cfoutput>
        <cfoutput><cfchartdata item="Koyunlar" value="#farmkoyun.TUKETIM_MIKTAR#"></cfoutput>
        <cfoutput><cfchartdata item="Köpekler" value="#farmkopek.TUKETIM_MIKTAR#"></cfoutput>
        <cfoutput><cfchartdata item="Tavuklar" value="#farmtavuk.TUKETIM_MIKTAR#"></cfoutput>
    </cfchartseries>
</cfchart>

<cfchart format="png" chartWidth="450" chartHeight="300" pieSliceStyle="solid">
    <cfchartseries type="pie" serieslabel="Çiftlik Hayvanları Üretim Miktarı">
        <cfoutput><cfchartdata item="İnekler" value="#farminek.URETIM_MIKTAR#"></cfoutput>
        <cfoutput><cfchartdata item="Keçiler" value="#farmkeci.URETIM_MIKTAR#"></cfoutput>
        <cfoutput><cfchartdata item="Kediler" value="#farmkedi.URETIM_MIKTAR#"></cfoutput>
        <cfoutput><cfchartdata item="Koyunlar" value="#farmkoyun.URETIM_MIKTAR#"></cfoutput>
        <cfoutput><cfchartdata item="Köpekler" value="#farmkopek.URETIM_MIKTAR#"></cfoutput>
        <cfoutput><cfchartdata item="Tavuklar" value="#farmtavuk.URETIM_MIKTAR#"></cfoutput>
    </cfchartseries>
</cfchart>

    <div style="margin:20px" >
    <button type="button" class="btn btn-primary" style="background-color:white; margin:10px; border-style:solid;border-width: 3px;border-color:#F08080;"><a href="https://catalyst.cosmetica.com.tr/index.cfm?fuseaction=farm.tanim" style="color:#F08080">Çiftlik Tüketim Üretim Tanım</a></button>
    <button type="button" class="btn btn-primary" style="background-color:white; margin:10px; border-style:solid;border-width: 3px;border-color:#F08080;"><a href="https://catalyst.cosmetica.com.tr/index.cfm?fuseaction=farm.kayit" style="color:#F08080">Çiftlik Tüketim Üretim Kayıt</a></button>
    <button type="button" class="btn btn-primary" style="background-color:white; margin:10px; border-style:solid;border-width: 3px;border-color:#F08080;"><a href="https://catalyst.cosmetica.com.tr/index.cfm?fuseaction=farm.dashboard" style="color:#F08080">Çiftlik Dashboard</a></button>
    </div>