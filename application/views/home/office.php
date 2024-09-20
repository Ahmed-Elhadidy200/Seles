<?php $this->load->view("partial/header"); ?>
<style>
   #office_module_list{
        display: grid;
        grid-template-columns: repeat(3, 1fr);
        grid-template-rows: repeat(2, 1fr);
        grid-column-gap: 120px;
        grid-row-gap: 70px;
        margin-top:50px;
    }
</style>
<script type="text/javascript">
	dialog_support.init("a.modal-dlg");
</script>

<h3 class="text-center" style="color:#0e6500;margin-top:70px"><?php echo "اختر عملية من الاتي لبدأ الاستخدام"; ?></h3>

<div id="office_module_list">
	<?php
	foreach($allowed_modules as $module)
	{
	?>
		<div class="module_item" title="<?php echo $this->lang->line('module_'.$module->module_id.'_desc');?>">
			<a href="<?php echo site_url("$module->module_id");?>"><img src="<?php echo base_url().'images/menubar/'.$module->module_id.'.png';?>" border="0" alt="Menubar Image" /></a>
			<a href="<?php echo site_url("$module->module_id");?>"><?php echo $this->lang->line("module_".$module->module_id) ?></a>
		</div>
	<?php
	}
	?>
</div>

<?php $this->load->view("partial/footer"); ?>
