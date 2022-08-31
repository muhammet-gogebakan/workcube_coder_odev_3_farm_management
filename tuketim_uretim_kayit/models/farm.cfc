
<cfcomponent>

    <cfset dsn = application.systemParam.systemParam().dsn>

    <cffunction name="get_list" access="public" > 
        <cfargument name="TARIH_BAS" default="">
        <cfargument name="TARIH_BIT" default="">
        <cfquery name="query_list" datasource="#dsn#">

            SELECT 
            KAYIT_ID,   --LİST ekranından UPDATE ekranına geçişte KAYIT_ID bilgisi gerekli olduğu için SELECT listesine eklendi
            TARIH,
            K.GRUP_TYPE,    --GRUP_TYPE hem tanım hem de kayıt tablosunda olduğu için, tablo adı da belirtilmeli
            TUKETILEN_MADDE_OLCU,
            TUKETIM_MIKTAR,
            URETILEN_MADDE_OLCU,
            URETIM_MIKTAR

            FROM catalyst_cosmetica.WORKCUBE_CODER_3_FARM_TUKETIM_URETIM_KAYIT K

            LEFT JOIN catalyst_cosmetica.WORKCUBE_CODER_3_FARM_TUKETIM_URETIM_TANIM T ON T.GRUP_TYPE = K.GRUP_TYPE
            WHERE TARIH BETWEEN <cfqueryparam cfsqltype ='CF_SQL_DATE' value='#arguments.TARIH_BAS#'> AND <cfqueryparam cfsqltype ='CF_SQL_DATE' value='#arguments.TARIH_BIT#'>
            ORDER BY TARIH
        </cfquery>
        <cfreturn query_list>
    </cffunction>

    <cffunction  name="add" access="public">    <!---listeye veri ekleme fonksiyonu---->
        <cfargument  name="TARIH" default="">
        <cfargument  name="GRUP_TYPE">
        <cfargument  name="TUKETIM_MIKTAR" default="">
        <cfargument  name="URETIM_MIKTAR" default="">

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
            <cfqueryparam cfsqltype='CF_SQL_DATE' value='#arguments.TARIH#'>,
            <cfqueryparam cfsqltype='CF_SQL_NVARCHAR' value='#arguments.GRUP_TYPE#'>,
            <cfqueryparam cfsqltype='CF_SQL_INTEGER' value='#arguments.TUKETIM_MIKTAR#' null="#len(arguments.TUKETIM_MIKTAR)?'no':'yes'#">,
            <cfqueryparam cfsqltype='CF_SQL_INTEGER' value='#arguments.URETIM_MIKTAR#' null="#len(arguments.URETIM_MIKTAR)?'no':'yes'#">
            )
        </cfquery>
    </cffunction>

    <cffunction name="get_row" access="public"> <!----listeyi düzenleme ekranı query fonksiyonu----->
        
        <cfargument name="KAYIT_ID" default="">
    
        <cfquery name="query_row" datasource="#dsn#">

            SELECT 
                * 
            FROM 
                WORKCUBE_CODER_3_FARM_TUKETIM_URETIM_KAYIT
            WHERE
                KAYIT_ID = <cfqueryparam cfsqltype ='CF_SQL_INTEGER' value='#arguments.KAYIT_ID#'>   
        </cfquery>
        <cfreturn query_row>
    </cffunction>

    <cffunction name="upd_func" access="public"> <!---listeyi düzenleme fonksiyonu---->

        <cfargument  name="KAYIT_ID" default="">
        <cfargument  name="TARIH"  default="">
        <cfargument  name="GRUP_TYPE" default="">
        <cfargument  name="TUKETIM_MIKTAR" default="">
        <cfargument  name="URETIM_MIKTAR" default="">

        <cfquery name="query_upd" datasource="#DSN#">
            UPDATE 
                WORKCUBE_CODER_3_FARM_TUKETIM_URETIM_KAYIT
            SET
                TARIH = <cfqueryparam cfsqltype='CF_SQL_NVARCHAR' value='#arguments.TARIH#'>,
                GRUP_TYPE = <cfqueryparam cfsqltype='CF_SQL_NVARCHAR' value='#arguments.GRUP_TYPE#'>,
                TUKETIM_MIKTAR = <cfqueryparam cfsqltype='CF_SQL_NVARCHAR' value='#arguments.TUKETIM_MIKTAR#' null="#len(arguments.TUKETIM_MIKTAR)?'no':'yes'#">,
                URETIM_MIKTAR = <cfqueryparam cfsqltype='CF_SQL_NVARCHAR' value='#arguments.URETIM_MIKTAR#' null="#len(arguments.URETIM_MIKTAR)?'no':'yes'#">
            WHERE
                KAYIT_ID = <cfqueryparam cfsqltype ='CF_SQL_INTEGER' value='#arguments.KAYIT_ID#'>
        </cfquery>

    </cffunction>

    <cffunction name="kayit_list" access="public" > 
        <cfargument name="TARIH_BAS" default="">
        <cfargument name="TARIH_BIT" default="">
        <cfquery name="query_kayit_list" datasource="#dsn#">

            SELECT 
            K.GRUP_TYPE,
            TUKETILEN_MADDE_OLCU,
            SUM (TUKETIM_MIKTAR) TUKETIM_MIKTAR,
            URETILEN_MADDE_OLCU,
            SUM (URETIM_MIKTAR) URETIM_MIKTAR,
            MUAYENE_PERIYODU,
            GELECEK_MUAYENE

            FROM catalyst_cosmetica.WORKCUBE_CODER_3_FARM_TUKETIM_URETIM_KAYIT K

            LEFT JOIN catalyst_cosmetica.WORKCUBE_CODER_3_FARM_TUKETIM_URETIM_TANIM T ON T.GRUP_TYPE = K.GRUP_TYPE
            WHERE TARIH BETWEEN <cfqueryparam cfsqltype ='CF_SQL_DATE' value='#arguments.TARIH_BAS#'> AND <cfqueryparam cfsqltype ='CF_SQL_DATE' value='#arguments.TARIH_BIT#'>

            GROUP BY K.GRUP_TYPE, TUKETILEN_MADDE_OLCU, URETILEN_MADDE_OLCU, MUAYENE_PERIYODU, GELECEK_MUAYENE

        </cfquery>
        <cfreturn query_kayit_list>
    </cffunction>

    <cffunction name="tuketim_uretim" access="public" > 
        <cfargument name="TARIH_BAS" default="">
        <cfargument name="TARIH_BIT" default="">
        <cfargument name="GRUP_TYPE" default="">

        <cfquery name="query_tuketim_uretim" datasource="#dsn#">

            SELECT 
            K.GRUP_TYPE,
            TUKETILEN_MADDE_OLCU,
            SUM (TUKETIM_MIKTAR) TUKETIM_MIKTAR,
            URETILEN_MADDE_OLCU,
            SUM (URETIM_MIKTAR) URETIM_MIKTAR

            FROM catalyst_cosmetica.WORKCUBE_CODER_3_FARM_TUKETIM_URETIM_KAYIT K

            LEFT JOIN catalyst_cosmetica.WORKCUBE_CODER_3_FARM_TUKETIM_URETIM_TANIM T ON T.GRUP_TYPE = K.GRUP_TYPE
            WHERE TARIH BETWEEN <cfqueryparam cfsqltype ='CF_SQL_DATE' value='#arguments.TARIH_BAS#'> AND <cfqueryparam cfsqltype ='CF_SQL_DATE' value='#arguments.TARIH_BIT#'>
            AND K.GRUP_TYPE LIKE <cfqueryparam cfsqltype ='CF_SQL_NVARCHAR' value='#arguments.GRUP_TYPE#'>
            GROUP BY K.GRUP_TYPE, TUKETILEN_MADDE_OLCU, URETILEN_MADDE_OLCU

        </cfquery>
        <cfreturn query_tuketim_uretim>
    </cffunction>

</cfcomponent>