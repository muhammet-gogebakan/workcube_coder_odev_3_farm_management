
<cffunction  name="excel_import_func">
<cfargument name="dosya_adi" default="">

<cfspreadsheet  action="read" src="#arguments.dosya_adi#.xlsx" query="excel_import" headerrow="1" excludeheaderrow="true">   

  <cfoutput query="excel_import">

        <cfquery name="query_add" datasource="#DSN#">

            INSERT INTO WORKCUBE_CODER_3_FARM_TUKETIM_URETIM_KAYIT
            (
            TARIH,
            GRUP_TYPE,
            TUKETIM_MIKTAR,
            URETIM_MIKTAR
            )
            VALUES
            (
            '#TARIH#',
            '#GRUP_TYPE#',
            '#TUKETIM_MIKTAR#',
            '#URETIM_MIKTAR#'
            )

        </cfquery>

  </cfoutput>

</cffunction>



<cfoutput>
    #excel_import_func(attributes.dosya_adi)#
</cfoutput>

<div style="margin:50px;">
    <cf_box title="İmport Edilen Bilgiler">
        <cf_grid_list>
            <thead>
                <tr>
                    <th>Tarih</th>
                    <th>Çiftlik Hayvanı</th>
                    <th>Tüketim Miktar</th>
                    <th>Üretim Miktar</th>
                </tr>
            </thead>
            <tbody>
                <cfoutput query="excel_import">
                    <tr>
                        <td>#TARIH#</td>
                        <td>#GRUP_TYPE#</td>
                        <td>#TUKETIM_MIKTAR#</td>
                        <td>#URETIM_MIKTAR#</td>   
                    </tr>
                </cfoutput>
            </tbody>
        </cf_grid_list>
    </cf_box>
</div>

    <div style="margin:20px" >
    <button type="button" class="btn btn-primary" style="background-color:white; margin:10px; border-style:solid;border-width: 3px;border-color:#F08080;"><a href="https://catalyst.cosmetica.com.tr/index.cfm?fuseaction=farm.tanim" style="color:#F08080">Çiftlik Tüketim Üretim Tanım</a></button>
    <button type="button" class="btn btn-primary" style="background-color:white; margin:10px; border-style:solid;border-width: 3px;border-color:#F08080;"><a href="https://catalyst.cosmetica.com.tr/index.cfm?fuseaction=farm.kayit" style="color:#F08080">Çiftlik Tüketim Üretim Kayıt</a></button>
    <button type="button" class="btn btn-primary" style="background-color:white; margin:10px; border-style:solid;border-width: 3px;border-color:#F08080;"><a href="https://catalyst.cosmetica.com.tr/index.cfm?fuseaction=farm.dashboard" style="color:#F08080">Çiftlik Dashboard</a></button>
    </div>
