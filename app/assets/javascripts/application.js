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


/*************JOB SHOW PAGE***************/
		/*$('.openJob').on('click', function(e){
			e.preventDefault();
			 let url = $(this).attr('href');
			$.get(url)
				.done((data) => {
					console.log(data);
					makeDisplayTemplate(data.job,'#jobsShowPage','#listedJobs' );
				})///////make this a modal to view the job show page
		});*/


		$('.jobShow').on('click', function(e){
			e.preventDefault();
			let url = $(this).attr('href');
			$.get(url)
				.done((res) => {
					console.log(res)
					let job = new Job(res.job.title,res.job.location,res.job.salary, res.job.level, res.job.description);
					makeDisplayTemplate(res.job, '#jobsShowPage', '.jobs_applied')
				})
		});

		$('.showJobForm').on('click', function(e){
			e.preventDefault();
			$('.newJobOverlay').removeClass('notVisible');
		})
		
		$('#editJob').on('click', function(e){
			e.preventDefault();
			$('.newJobOverlay').removeClass('notVisible');
		})

		$('#close').on('click', function(e){
			$('.newJobOverlay').addClass('notVisible');
		})
		readyNewJobForm();
		addDeleteJobListener();
 });


 /***************READY FORM**************/
 function readyNewJobForm(){
 	$('#new_job').on('submit', function(e){
 		e.preventDefault();
 		let action = $(this).attr('action');
 		let title = $('#job_title').val();
 		let local = $('#job_location').val();
 		let des = $('#job_description').val();
 		let level = $('#job_level').val();
 		let salary = $('#job_salary').val();
 		let jobAttrs = new Job(title,local,salary,level,des);
 		let org_id = action.split('/')[2];
 		$('.newJobOverlay').addClass('notVisible');
 		$.post(`${action}`,
			{job: {
						title: title,
						location: local,
						salary: salary,
						level: level,
						description: des
			}})
 			.done((newJobRes) => {
 				let newJob = new Job(newJobRes.title,newJobRes.local, newJobRes.salary, newJobRes.level, newJobRes.des, newJobRes.created_at);
 				let daysOld = newJob.daysOld();
 				let url = `/organizations/${org_id}/jobs`
 				let orgJobPath = `${url}/${newJobRes.id}`
 				$('#orgJobsList').append(`<li><a class="openJob" href="${orgJobPath}">${newJobRes.title}</a> | ` + `<a href="${orgJobPath}" class="deleteJob">Delete</a>\n<hr></li>`)
 				$('#new_job')[0].reset();

 			})
 	})

 }



/*************JOB Class***************/
class Job {
	constructor(title,location,salary,level,description, timeStamp){
		this.title = title;
		this.location = location;
		this.salary = salary;
		this.level = level;
		this.description = description;
		this.timeStamp = timeStamp;
	}

	 daysOld(){
		let now = new Date();
		let created = new Date(this.timeStamp);
		let now_ms = now.getTime();
		let created_ms = created.getTime();
		let diff = now_ms - created_ms/(1000*60*60*24);
		return Math.round(diff);
	}
}

/*****************DELETE****************/
function addDeleteJobListener(){
 $(document).on('click', '.deleteJob', function(e){
	 e.preventDefault();
	 let linkTag = $(this);
	 $.ajax({
		 url: $(this).attr('href'),
		 type: "DELETE",
		 cache: false
	 })
	 .done(function(res){
		 $(linkTag).parent().remove();
	 })
 })
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
