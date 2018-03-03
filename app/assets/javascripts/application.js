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
//= require jquery
//= require rails-ujs

//= require_tree .

//= require popper

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
        inputs[i].classList.add('form-control');
      }
    }

		$('#newJobBtn').on('click', function(e){
			e.preventDefault();
			window.location.replace($(this).attr('href'));

		})

		$('#new_job').on('submit', function(e){
	  	e.preventDefault();
			let action = $(this).attr('action');
			let title = $('#job_title').val();
			let local = $('#job_location').val();
			let des = $('#job_description').val();
			let level = $('#job_level').val();
			let salary = $('#job_salary').val();
			let job = new Job(title,local,salary,level,des);
			let org_id = action.split('/')[2];
			$('.newJobOverlay').addClass('notVisible');
			$.post(`${action}`, {job: job})
				.done((newJobRes) => {
					let org_id = newJobRes.organization_id;
					let url = `/organizations/${org_id}/jobs`
					let jobNum = $('#orgJobsList').children.length;
					$('#orgJobsList').append(`<li>${jobNum}. ${newJobRes.title} |` + `<a href="#" id="deleteJob">Delete</a>`)
				})
		})
/*************JOB SHOW PAGE***************/
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

		$('.deleteJob').on('click', function(e){

			let linkTag = $(this);
			$.ajax({
				url: $(this).attr('href'),
				type: "DELETE"
			})
			.done(function(res){
				$(linkTag).parent().remove();
			})

			e.preventDefault();
		})

$('.showJobForm').on('click', function(e){
	e.preventDefault();
	$('.newJobOverlay').removeClass('notVisible');
})



$('#close').on('click', function(e){
	$('.newJobOverlay').addClass('notVisible');
})








 });


 /*****************DELETE JOB***********************/


/*************JOB Class***************/
class Job {
	constructor(title,location,salary,level,description){
		this.title = title;
		this.location = location;
		this.salary = salary;
		this.level = level;
		this.description = description;
	}
}

/*************JOBS INDEX***************/
function listJobs(){
	$.get('/jobs')
		.done((jobs) => {
			jobs.forEach(function(job){
					makeDisplayTemplate(job, '#jobsShowPage', '.output');
			});
		});
}
/*************HANDLEBARS TEMPLATE-OUTPUT***************/
function makeDisplayTemplate(data, template, output) {
  let displayTemplate =  $(template).html();
  let finalTemplate = Handlebars.compile(displayTemplate);
  let html = finalTemplate(data);
	$(output).html(html);

}
