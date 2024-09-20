<!doctype html>
<html lang="<?php echo current_language_code(); ?>">

<head>
  <meta charset="utf-8">
	<base href="<?php echo base_url(); ?>">
	<title><?php echo "The Name Of Market"?></title>
	<meta content="width=device-width, initial-scale=1" name="viewport">
  <meta content="noindex, nofollow" name="robots">
	<link href="images/favicon.png" rel="shortcut icon" type="image/x-icon">
  <link href="<?php echo 'dist/bootswatch-5/' . (empty($this->config->item('theme')) || 'paper' == $this->config->item('theme') || 'readable' == $this->config->item('theme') ? 'flatly' : $this->config->item('theme')) . '/bootstrap.min.css'; ?>" rel="stylesheet" type="text/css">
  <!-- start css template tags -->
  <link rel="stylesheet" type="text/css" href="css/login.min.css"/>
  <!-- end css template tags -->
	<meta content="#0e6500" name="theme-color">
</head>

<body class="bg-light d-flex flex-column">
  <main class="d-flex justify-content-around align-items-center flex-grow-1" style="background-color:#0046657d;">
    <div class="container-login container-fluid d-flex flex-column flex-md-row bg-body shadow rounded m-3 p-4 p-md-0">
      <div class="box-logo d-flex flex-column justify-content-center align-items-center border-end px-4 pb-3 p-md-4">
      <?php if ($this->Appconfig->get('company_logo')): ?>
        <img class="logo w-100" src="<?php echo base_url('uploads/' . $this->Appconfig->get('company_logo')); ?>" alt="<?php echo $this->lang->line('common_logo') . '&nbsp;' . $this->config->item('company'); ?>">
      <?php else: ?>
        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512">
          <path fill="#799dac" d="M57.7 193l9.4 16.4c8.3 14.5 21.9 25.2 38 29.8L163 255.7c17.2 4.9 29 20.6 29 38.5l0 39.9c0 11 6.2 21 16 25.9s16 14.9 16 25.9l0 39c0 15.6 14.9 26.9 29.9 22.6c16.1-4.6 28.6-17.5 32.7-33.8l2.8-11.2c4.2-16.9 15.2-31.4 30.3-40l8.1-4.6c15-8.5 24.2-24.5 24.2-41.7l0-8.3c0-12.7-5.1-24.9-14.1-33.9l-3.9-3.9c-9-9-21.2-14.1-33.9-14.1L257 256c-11.1 0-22.1-2.9-31.8-8.4l-34.5-19.7c-4.3-2.5-7.6-6.5-9.2-11.2c-3.2-9.6 1.1-20 10.2-24.5l5.9-3c6.6-3.3 14.3-3.9 21.3-1.5l23.2 7.7c8.2 2.7 17.2-.4 21.9-7.5c4.7-7 4.2-16.3-1.2-22.8l-13.6-16.3c-10-12-9.9-29.5 .3-41.3l15.7-18.3c8.8-10.3 10.2-25 3.5-36.7l-2.4-4.2c-3.5-.2-6.9-.3-10.4-.3C163.1 48 84.4 108.9 57.7 193zM464 256c0-36.8-9.6-71.4-26.4-101.5L412 164.8c-15.7 6.3-23.8 23.8-18.5 39.8l16.9 50.7c3.5 10.4 12 18.3 22.6 20.9l29.1 7.3c1.2-9 1.8-18.2 1.8-27.5zM0 256a256 256 0 1 1 512 0A256 256 0 1 1 0 256z"/>
      </svg>
      <?php endif; ?>
      </div>
      <section class="box-login d-flex flex-column justify-content-center align-items-center p-md-4">
				<?php echo form_open('login'); ?>
		<h3 class="text-center" style="color:#0046657d;font-family:'Cairo';letter-spacing:0;">تسجيل الدخول</h3>
    <br>
        <?php if (validation_errors()): ?>
        <div class="alert alert-danger mt-3">
          <?php echo validation_errors(); ?>
        </div>
        <?php endif; ?>
				<?php if (!$this->migration->is_latest()): ?>
        <div class="alert alert-info mt-3">
					<?php echo $this->lang->line('login_migration_needed', $this->config->item('application_version')); ?>
				</div>
				<?php endif; ?>
        <?php if (empty($this->config->item('login_form')) || 'floating_labels'==($this->config->item('login_form'))): ?>
        <div class="form-floating mt-3">
          <input class="form-control" id="input-username" name="username" type="text" placeholder="<?php echo $this->lang->line('login_username'); ?>">
          <label for="input-username"><?php echo $this->lang->line('login_username'); ?></label>
        </div>
        <div class="form-floating mb-3">
          <input class="form-control" id="input-password" name="password" type="password" placeholder="<?php echo $this->lang->line('login_password'); ?>">
          <label for="input-password"><?php echo $this->lang->line('login_password'); ?></label>
        </div>
      <?php elseif ('input_groups'==($this->config->item('login_form'))): ?>
        <div class="input-group mt-3">
          <span class="input-group-text" id="input-username">
            <svg class="bi" fill="currentColor" viewBox="0 0 16 16" xmlns="http://www.w3.org/2000/svg">
              <title><?php echo $this->lang->line('common_icon') . '&nbsp;' . $this->lang->line('login_username'); ?></title>
              <path d="M3 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H3zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"/>
            </svg>
          </span>
          <input class="form-control" name="username" type="text" placeholder="<?php echo $this->lang->line('login_username'); ?>" aria-label="<?php echo $this->lang->line('login_username'); ?>" aria-describedby="input-username" <?php if (ENVIRONMENT == "testing") echo "value='admin'"; ?>>
        </div>
        <div class="input-group mb-3">
          <span class="input-group-text" id="input-password">
            <svg class="bi" fill="currentColor" viewBox="0 0 16 16" xmlns="http://www.w3.org/2000/svg">
              <title><?php echo $this->lang->line('common_icon') . '&nbsp;' . $this->lang->line('login_password'); ?></title>
              <path d="M3.5 11.5a3.5 3.5 0 1 1 3.163-5H14L15.5 8 14 9.5l-1-1-1 1-1-1-1 1-1-1-1 1H6.663a3.5 3.5 0 0 1-3.163 2zM2.5 9a1 1 0 1 0 0-2 1 1 0 0 0 0 2z"/>
            </svg>
          </span>
          <input class="form-control" name="password" type="password" placeholder="<?php echo $this->lang->line('login_password'); ?>" aria-label="<?php echo $this->lang->line('login_password'); ?>" <?php if (ENVIRONMENT == "testing") echo "value='pointofsale'"; ?>" aria-describedby="input-password">
        </div>
        <?php endif; ?>
				<?php if($this->config->item('gcaptcha_enable')) {
					echo '<script src="https://www.google.com/recaptcha/api.js"></script>';
					echo '<div class="g-recaptcha mb-3" align="center" data-sitekey="' . $this->config->item('gcaptcha_site_key') . '"></div>'; }
        ?>
        <div class="d-grid">
          <button class="btn btn-lg btn-primary" name="login-button" type="submit" style="background-color:#0046657d !important"><?php echo "دخول"; ?></button>
        </div>
				<?php echo form_close(); ?>
      </section>
    </div>
  </main>
	</div>
	</div>

	<div id="footer" style ='text-align:center'>
<h4 style='color:#0046657d'>Created With By Ahmed_Elhadidy Phone:+201000412617</h4>
	</div>
</body>
</body>

</html>
