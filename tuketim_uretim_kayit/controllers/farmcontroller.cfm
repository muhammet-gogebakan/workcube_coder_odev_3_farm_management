
<cfscript>
	if(attributes.tabMenuController eq 0)
	{
		WOStruct = StructNew();		

		WOStruct['#attributes.fuseaction#'] = structNew();		

		WOStruct['#attributes.fuseaction#']['default'] = 'list';	//<!---default event 'list' olarak tanımlama. bu tanımlama sayesinde, ilk açılışta views/list.cfm sayfası gelir. eğer 'add' olarak tanımlasaydık views/add.cfm sayfası gelirdi ---->
		if(not isdefined('attributes.event'))
			attributes.event = WOStruct['#attributes.fuseaction#']['default'];		//<!---attributes'dan event gelmedi ise 'list' olarak tanımladığımız default event'i tanımlama----->
	
		WOStruct['#attributes.fuseaction#']['list'] = structNew();	//'list' event'ına struct tanımlama
		WOStruct['#attributes.fuseaction#']['list']['window'] = 'normal';	//window parametresi ile hangi ekranda görüneceğini tanımlama
		WOStruct['#attributes.fuseaction#']['list']['fuseaction'] = 'farm.kayit';	//burda fuseaction tekrar belirtiliyor ki doğru bir şekilde çalışsın
		WOStruct['#attributes.fuseaction#']['list']['filePath'] = '/V16/add_options/mgogebakan_w3/coder_odev_3_farm_management/tuketim_uretim_kayit/views/list.cfm';	 	 

		WOStruct['#attributes.fuseaction#']['add'] = structNew(); //'add' event'ına struct tanımlama
		WOStruct['#attributes.fuseaction#']['add']['window'] = 'normal';	//window parametresi ile hangi ekranda görüneceğini tanımlama
		WOStruct['#attributes.fuseaction#']['add']['fuseaction'] = 'farm.kayit&event=add';
		WOStruct['#attributes.fuseaction#']['add']['filePath'] = '/V16/add_options/mgogebakan_w3/coder_odev_3_farm_management/tuketim_uretim_kayit/views/add.cfm';		//add ekran önyüz
		WOStruct['#attributes.fuseaction#']['add']['queryPath'] = '/V16/add_options/mgogebakan_w3/coder_odev_3_farm_management/tuketim_uretim_kayit/actions/add.cfm';	//add ekran işlevi
		WOStruct['#attributes.fuseaction#']['add']['nextEvent'] = WOStruct['#attributes.fuseaction#']['default'];				//add next event

		if (isDefined("attributes.KAYIT_ID")) {

		WOStruct['#attributes.fuseaction#']['upd'] = structNew(); //upd işlevi için WO struct yapısı ekleme
		WOStruct['#attributes.fuseaction#']['upd']['window'] = 'normal';
		WOStruct['#attributes.fuseaction#']['upd']['fuseaction'] = 'farm.kayit&event=upd';
		WOStruct['#attributes.fuseaction#']['upd']['filePath'] = '/V16/add_options/mgogebakan_w3/coder_odev_3_farm_management/tuketim_uretim_kayit/views/upd.cfm';		//upd ekran önyüz
		WOStruct['#attributes.fuseaction#']['upd']['queryPath'] = '/V16/add_options/mgogebakan_w3/coder_odev_3_farm_management/tuketim_uretim_kayit/actions/upd.cfm';	//upd ekran işlevi
		WOStruct['#attributes.fuseaction#']['upd']['nextEvent'] = WOStruct['#attributes.fuseaction#']['default'];				//upd next event

		}
	}
</cfscript>
