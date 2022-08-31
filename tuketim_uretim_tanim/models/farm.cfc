
<cfcomponent>

    <cfset dsn = application.systemParam.systemParam().dsn>

    <cffunction name="get_list" access="public" > <!---listeleme query fonksiyonu---->
        <cfargument name="GRUP_TYPE" default="">
        <cfquery name="query_list" datasource="#dsn#">

            SELECT 
                * 
            FROM 
                WORKCUBE_CODER_3_FARM_TUKETIM_URETIM_TANIM
            WHERE GRUP_TYPE LIKE <cfqueryparam cfsqltype ='CF_SQL_NVARCHAR' value='%#arguments.GRUP_TYPE#%'>
            ORDER BY GRUP_ID

        </cfquery>
        <cfreturn query_list>
    </cffunction>

    <cffunction  name="add" access="public">    <!---listeye veri ekleme fonksiyonu---->
        <cfargument  name="GRUP_ID" default="">
        <cfargument  name="GRUP_TYPE">
        <cfargument  name="TUKETILEN_MADDE_OLCU" default="">
        <cfargument  name="URETILEN_MADDE_OLCU" default="">
        <cfargument  name="MUAYENE_PERIYODU" default="">
        <cfargument  name="GELECEK_MUAYENE" default="">

        <cfquery name="query_add" datasource="#DSN#">

            INSERT INTO WORKCUBE_CODER_3_FARM_TUKETIM_URETIM_TANIM
            (
            GRUP_TYPE,
            TUKETILEN_MADDE_OLCU,
            URETILEN_MADDE_OLCU,
            MUAYENE_PERIYODU,
            GELECEK_MUAYENE
            )
            VALUES
            (
            <cfqueryparam cfsqltype='CF_SQL_NVARCHAR' value='#arguments.GRUP_TYPE#'>,
            <cfqueryparam cfsqltype='CF_SQL_NVARCHAR' value='#arguments.TUKETILEN_MADDE_OLCU#' null="#len(arguments.TUKETILEN_MADDE_OLCU)?'no':'yes'#">,
            <cfqueryparam cfsqltype='CF_SQL_NVARCHAR' value='#arguments.URETILEN_MADDE_OLCU#' null="#len(arguments.URETILEN_MADDE_OLCU)?'no':'yes'#">,
            <cfqueryparam cfsqltype='CF_SQL_NVARCHAR' value='#arguments.MUAYENE_PERIYODU#' null="#len(arguments.MUAYENE_PERIYODU)?'no':'yes'#">,
            <cfqueryparam cfsqltype='CF_SQL_NVARCHAR' value='#arguments.GELECEK_MUAYENE#' null="#len(arguments.GELECEK_MUAYENE)?'no':'yes'#">
            )
        </cfquery>
    </cffunction>

    <cffunction name="get_row" access="public"> <!----listeyi düzenleme ekranı query fonksiyonu----->
        
        <cfargument name="GRUP_ID" default="">
    
        <cfquery name="query_row" datasource="#dsn#">

            SELECT 
                * 
            FROM 
                WORKCUBE_CODER_3_FARM_TUKETIM_URETIM_TANIM
            WHERE
                GRUP_ID = <cfqueryparam cfsqltype ='CF_SQL_NVARCHAR' value='#arguments.GRUP_ID#'>     <!---e_soru: cf_sql_integer'da hata veriyor ancak, CF_SQL_NVARCHAR'da hata vermiyor---->
        </cfquery>
        <cfreturn query_row>
    </cffunction>

    <cffunction name="upd_func" access="public"> <!---listeyi düzenleme fonksiyonu---->

        <cfargument  name="GRUP_ID" default="">
        <cfargument  name="GRUP_TYPE" default="">
        <cfargument  name="TUKETILEN_MADDE_OLCU" default="">
        <cfargument  name="URETILEN_MADDE_OLCU" default="">
        <cfargument  name="MUAYENE_PERIYODU" default="">
        <cfargument  name="GELECEK_MUAYENE" default="">

        <cfquery name="query_upd" datasource="#DSN#">
            UPDATE 
                WORKCUBE_CODER_3_FARM_TUKETIM_URETIM_TANIM
            SET
                GRUP_TYPE = <cfqueryparam cfsqltype='CF_SQL_NVARCHAR' value='#arguments.GRUP_TYPE#'>,
                TUKETILEN_MADDE_OLCU = <cfqueryparam cfsqltype='CF_SQL_NVARCHAR' value='#arguments.TUKETILEN_MADDE_OLCU#' null="#len(arguments.TUKETILEN_MADDE_OLCU)?'no':'yes'#">,
                URETILEN_MADDE_OLCU = <cfqueryparam cfsqltype='CF_SQL_NVARCHAR' value='#arguments.URETILEN_MADDE_OLCU#'>,
                MUAYENE_PERIYODU = <cfqueryparam cfsqltype='CF_SQL_NVARCHAR' value='#arguments.MUAYENE_PERIYODU#'>,
                GELECEK_MUAYENE = <cfqueryparam cfsqltype='CF_SQL_NVARCHAR' value='#arguments.GELECEK_MUAYENE#'>
            WHERE
                GRUP_ID = <cfqueryparam cfsqltype ='CF_SQL_NVARCHAR' value='#arguments.GRUP_ID#'>
        </cfquery>

    </cffunction>

</cfcomponent>