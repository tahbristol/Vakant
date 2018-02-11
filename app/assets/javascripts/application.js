// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs

//= require_tree .

//= require popper
//= require jquery
//= require bootstrap-sprockets


$(function(){
   //set notices to disappear
  if($('#flash_alert') || $('#flash_notice') || $('#flash_error')){
    setTimeout(function(){
       $('#noticeFlashes').fadeOut('slow');

    },3000);
  }
  var inputs = document.getElementsByTagName('input');
    for (var i = 0; i<inputs.length; i++) {
      if (inputs[i].parentElement.className != "button_to") {
        inputs[i].addClass('form-control');
      }
    }

		$('.openJob').on('click', function(e){

			e.preventDefault();
			 let url = $(this).attr('href');
			$.get(url)
				.done((data) => {
					makeDisplayTemplate(data.job,'#jobsShowPage','#listedJobs' );
				})
		});


		$('.jobShow').on('click', function(e){
			e.preventDefault();
			 let url = $(this).attr('href');
			 $.get(url)
			 	.done((res) => {
					let job = new Job(res.job.title,res.job.location,res.job.salary, res.job.level, res.job.description);
					makeDisplayTemplate(res.job, '#jobsShowPage', '.jobs_applied')
				})
		});
 });

class Job {
	constructor(title,location,salary,level,description){
		this.title = title;
		this.location = location;
		this.salary = salary;
		this.level = level;
		this.description = description;
	}
}


function listJobs(){
	$.get('/jobs')
		.done((jobs) => {
			jobs.forEach(function(job){
					makeDisplayTemplate(job, '#jobsShowPage', '.output');
			});
		});
}


function showJob(data,template,output){

}

function makeDisplayTemplate(data, template, output) {
	console.log(template);
  let displayTemplate =  $(template).html();
  let finalTemplate = Handlebars.compile(displayTemplate);
  let html = finalTemplate(data);
	console.log(output);
	$(output).html(html);

}
