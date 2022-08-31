<!---list.cfm---><!---listeyi düzenleme linki eklendi--->


<cfparam name="attributes.GRUP_TYPE" default="">

<cfobject name="farmmodel" type="component" component="V16.add_options.mgogebakan_w3.coder_odev_3_farm_management.tuketim_uretim_tanim.models.farm">
  <cfset farmdata=farmmodel.get_list(attributes.GRUP_TYPE)>
    <cf_box title="Çiftlik Tüketim Üretim Tanım">

     
        
        <div style="float:right; margin-bottom:10px;">
          <button>
            <a class="ui-btn ui-btn-gray" style="height:35px; width:20px" href="https://catalyst.cosmetica.com.tr/index.cfm?fuseaction=farm.tanim&event=add"><div style="font-size:30px; height:40px">+</div></a>
          </button>
        </div>
      <cf_box_search plus="0">
        <cfform>
        <div class="form-group" id="item-GRUP_TYPE">
          <label class="col col-4 col-xs-12">Çiftlik Hayvanı</label>
          <div class="col col-4 col-xs-12">
            <input type="text" name="GRUP_TYPE" id="GRUP_TYPE" value="<cfoutput>#attributes.GRUP_TYPE#</cfoutput>">
          </div>
          <cf_wrk_search_button>
        </div>
        </cfform>
      </cf_box_search>

      <cf_grid_list>
        <thead>
          <tr>
            <th>Kayıt No</th>
            <th>Çiftlik Hayvanı</th>
            <th>Tüketilen Madde (Ölçü)</th>
            <th>Üretilen Madde (Ölçü)</th>
            <th>Muayene Periyodu</th>
            <th>Gelecek Muayene</th>
            <th style="text-align:center" >(düzenle)</th>
          </tr>
        </thead>
        <tbody>
          <cfoutput query="farmdata">
            <tr>
            <td>#GRUP_ID#</td>
            <td>#GRUP_TYPE#</td>
            <td>#TUKETILEN_MADDE_OLCU#</td>
            <td>#URETILEN_MADDE_OLCU#</td>
            <td>#MUAYENE_PERIYODU#</td>
            <td>#GELECEK_MUAYENE#</td>
            <td>
              <a href="https://catalyst.cosmetica.com.tr/index.cfm?fuseaction=farm.tanim&event=upd&GRUP_ID=#GRUP_ID#"><i class="fa fa-pencil"></i></a> 
            </td>
            </tr>
          </cfoutput>
        </tbody>
      </cf_grid_list>
    </cf_box>


    <div style="margin:20px" >
    <button type="button" class="btn btn-primary" style="background-color:white; margin:10px; border-style:solid;border-width: 3px;border-color:#F08080;"><a href="https://catalyst.cosmetica.com.tr/index.cfm?fuseaction=farm.tanim" style="color:#F08080">Çiftlik Tüketim Üretim Tanım</a></button>
    <button type="button" class="btn btn-primary" style="background-color:white; margin:10px; border-style:solid;border-width: 3px;border-color:#F08080;"><a href="https://catalyst.cosmetica.com.tr/index.cfm?fuseaction=farm.kayit" style="color:#F08080">Çiftlik Tüketim Üretim Kayıt</a></button>
    <button type="button" class="btn btn-primary" style="background-color:white; margin:10px; border-style:solid;border-width: 3px;border-color:#F08080;"><a href="https://catalyst.cosmetica.com.tr/index.cfm?fuseaction=farm.dashboard" style="color:#F08080">Çiftlik Dashboard</a></button>
    </div>