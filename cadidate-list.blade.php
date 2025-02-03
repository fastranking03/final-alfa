@if (session()->has('username') && session()->has('password'))
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
    <title>HRMS | Candidate List</title>
    <meta content="Admin Dashboard" name="description" />
    <meta content="ThemeDesign" name="author" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    @include('head.header')
    <style>
        .dataTables_filter {
            text-align: right;
        }
        .user-icon{
                border: 1px solid #4500b4;
                width: 50px;
                height: 50px;
                border-radius: 50%;
                display: flex;
                align-items: center;
                justify-content: center;
            }
    </style>
</head>
<style>
    .craeted_by{
        font-size: 12px;
    font-weight: 500;
    color: #474D6A; 
    right: 15px;
    bottom: 8px;
    }
    .status {
        font-size: 13px;
        padding: 0px 10px;
        border-radius: 13px;
        margin: 0 6px;
    }
    .Live {
        background-color: #4CAF50;
        /* Green for 'Live' */
    }
    .Training {
        background-color: #FF9800;
        /* Orange for 'Training' */
    }
    .Offered {
        background-color: #ACFFB0;
        border: 1px solid #138808;
        color: #138808;
    }
    .Rejected {
        background-color: #f44336;
        /* Red for 'Rejected' */
    }
    .Next {
        border: 1px solid rgb(69, 0, 180);
        color: rgb(69, 0, 180);
        background: rgb(69 0 180 / 14%);
    }
    .Scheduled {
        border: 1px solid #12B76A;
        color: #12b76a;
        background: #ECFDF3;
    }
    .Shortlisted {
        background-color: #F1EFFF;
        border: 1px solid #000080; ;
        color: #000080;
    }
    .Follow-up {
        background-color: #9f9e9e21;
        border: 1px solid #9F9E9E;
        color: #000000;
    }
</style>
<body class="fixed-left">
    <!-- Loader -->
    <div id="preloader">
        <div id="status">
            <div class="spinner"></div>
        </div>
    </div>
    <!-- Begin page -->
    <div id="wrapper">
        <!-- ========== Left Sidebar Start ========== -->
        @include('component.sidebar')
        <!-- Left Sidebar End -->
        <!-- Start right Content here -->
        <div class="content-page">
            <!-- Start content -->
            <div class="content">
                <!-- Top Bar Start -->
                @include('component.navbar')
                <!-- Top Bar End -->
                <br><br>
                <div class="page-content-wrapper ">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-12">
                                <div class="text-end">
                                    <button class="go-back-button secondary-button-op-100 waves-effect waves-light mr-2">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" viewBox="0 0 24 24">
                                            <path fill="currentColor" d="M20 11H7.83l5.59-5.59L12 4l-8 8l8 8l1.41-1.41L7.83 13H20z" />
                                        </svg>
                                        Go Back
                                    </button>
                                    <a href="{{ route('add-candidate') }}" type="button" class="primary-button-op-100 waves-effect waves-light">+ Add New</a>
                                </div>
                                <br>
                                <div class="row candidate-box">
                                    <div class="col-md-3">
                                        <div class="candidate-filter-lay">
                                            <div class="candidate-filter">
                                                <h3 class="total-app"> Profiles found <span id="profileCount"></h3>
                                                <div class="candidate-filter-by-flex">
                                                    <div>
                                                        <select name="candi_status" id="candidateStatus">
                                                            <option value="All">All</option>
                                                            <option value="Shortlisted">Shortlisted</option>
                                                            <option value="Scheduled">Scheduled</option>
                                                            <option value="Pending">Pending</option>
                                                            <option value="Rejected">Rejected</option>
                                                            <option value="Offered">Offered</option>
                                                            <option value="Follow-up">Follow Up</option>
                                                            <option value="Next Round Pending">Next Round Pending</option>
                                                            <option value="Others">Others</option>
                                                        </select>
                                                    </div>
                                                    <div class="relative">
                                                        <select name="dateFilter" id="dateFilter">
                                                            <option value="All">All</option>
                                                            <option value="today">Today</option>
                                                            <option value="This Week">This Week</option>
                                                            <option value="This Month">This Month</option>
                                                            <option value="Custom">Custom</option>
                                                        </select>

                                                        <div class="custom-date-box" id="customDate">
                                                            <div>
                                                                <div>
                                                                    <label for="fromDate">From</label>
                                                                    <input type="date" id="fromDate" class="form-control">
                                                                </div>
                                                                <div>
                                                                    <label for="toDate">To</label>
                                                                    <input type="date" id="toDate" class="form-control">
                                                                </div>
                                                                <div>
                                                                    <button class="primary-button-op-100 waves-effect waves-light" id="searchDateButton">Check</button>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>

                                                </div>
                                            </div>
                                        </div>
                                        <div class="search-filter-lay mt-3">
                                            <div class="search-filter">
                                                <h3 class="total-app">Find within results </h3>
                                                <div>
                                                    <input type="search" class="search-control form-control" id="candidateSearch" placeholder="Type here..">
                                                </div>
                                            </div>
                                            <div>
                                                <ul class="candidate-filter-list d-none">
                                                  
                                                </ul>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-md-9">
                                        @foreach ($candidates as $candidate)

                                        @if ($candidate->candidateStatusOnJobs->isNotEmpty())
                                        @php
                                          // Define priority order
                                          $statusPriority = [
                                                'Live',
                                                'Training',
                                                'Offered',
                                                'Rejected',
                                                'Next Round Pending',
                                                'Selected',
                                                'Scheduled',
                                                'Shortlisted',
                                                'Follow-up',
                                            ];

                                          // Get candidate statuses with their timestamps
                                          $statuses = $candidate->candidateStatusOnJobs
                                            ->sortByDesc('updated_at')
                                            ->pluck('status')
                                            ->toArray();

                                          // Initialize highest priority status and round
                                          $highestPriorityStatus = 'Follow-up';
                                          $highestPriorityRound = null;

                                          // Find the most recent status matching the priority order
                                          foreach ($statuses as $status) {
                                            if (in_array($status, $statusPriority)) {
                                                $highestPriorityStatus = $status;
                                                $sortedInterviews = $candidate->interviews->sortByDesc('round');
                                                $matchedInterview = $sortedInterviews->firstWhere('status2', $status);
                                                $highestPriorityRound = $matchedInterview?->round;
                                                break;
                                            }
                                        }
                                          @endphp
                                            @php
                                                $statusColors = [
                                                    'Live' => '#4CAF50',
                                                    'Training' => '#FF9800',
                                                    'Offered' => '#2196F3',
                                                    'Rejected' => '#f44336',
                                                    'Next Round Pending' => 'rgb(69, 0, 180)',
                                                    'Selected' => '#12b76a',
                                                    'Scheduled' => '#12b76a',
                                                    'Shortlisted' => '#009688',
                                                    'Follow-up' => '#ff5722',
                                                ];
                                            @endphp
 
                                        <div class="candidate-box-layout candidate-item" data-contact = "{{ $candidate->contactno }}" data-education="Graduation" data-location="{{ $candidate->addressline1 }} {{ $candidate->addressline2 }} {{ $candidate->city }} {{ $candidate->state }} {{ $candidate->pincode }} {{ $candidate->country }}" data-date="{{ date('d-M-Y', strtotime($candidate->created_at)) }}" data-status="{{ $highestPriorityStatus }}" data-name="{{ $candidate->title . ' ' . $candidate->firstname . ' ' . $candidate->middlename . ' ' . $candidate->lastname }}" data-email="{{ $candidate->email }}">
                                            <div class="user-icon">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="30" height="40" viewBox="0 0 448 512"><path fill="#4500b4" d="M224 256c70.7 0 128-57.3 128-128S294.7 0 224 0S96 57.3 96 128s57.3 128 128 128m95.8 32.6L272 480l-32-136l32-56h-96l32 56l-32 136l-47.8-191.4C56.9 292 0 350.3 0 422.4V464c0 26.5 21.5 48 48 48h352c26.5 0 48-21.5 48-48v-41.6c0-72.1-56.9-130.4-128.2-133.8"/></svg>
                                            </div>
                                            <div class="candidate-details-list">
                                                <h2 class="candidate-h2" style="display:flex">
                                                    <a style="color: #4500b4;" href="{{ route('candidate-detail-view', ['candidateid' => $candidate->candidateid]) }}">{{ \Illuminate\Support\Str::limit( $candidate->title . ' ' . $candidate->firstname . ' ' . $candidate->middlename . ' ' . $candidate->lastname,  20,  '...'  ) }}</a>
                                                    

                                                    <span id="currentStatus" class="status {{ $highestPriorityStatus }}"style="display: flex ; align-items: center; gap: 4px;">
                                                        <svg xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 16 16">
                                                            <path fill="{{ $statusColors[$highestPriorityStatus] ?? '#12B76A' }}" d="M8 15c-3.86 0-7-3.14-7-7s3.14-7 7-7s7 3.14 7 7s-3.14 7-7 7M8 2C4.69 2 2 4.69 2 8s2.69 6 6 6s6-2.69 6-6s-2.69-6-6-6" />
                                                            <circle cx="8" cy="8" r="4" fill="{{ $statusColors[$highestPriorityStatus] ?? '#12B76A' }}" />
                                                        </svg> 
                                                      @if($highestPriorityRound)
                                                      <span id="currentRound">
                                                        @switch($highestPriorityRound)
                                                        @case(1)
                                                        <div>{{ "HR Round $highestPriorityStatus" }}</div>
                                                        @break
                                                        @case(2)
                                                        <div>{{ "Written Assessment $highestPriorityStatus" }}</div>
                                                        @break
                                                        @case(3)
                                                        <div>{{ "Technical Round $highestPriorityStatus" }}</div>
                                                        @break
                                                        @case(4)
                                                        <div>{{ "Final Discussion $highestPriorityStatus" }}</div>
                                                        @break
                                                        @default
                                                        <div>{{ $highestPriorityStatus }}</div>
                                                        @endswitch
                                                      </span>
                                                      		@else
                                                            <div>{{ $highestPriorityStatus }}</div>
                                                        @endif
                                                        @else
                                                        <span id="currentStatus">{{ "Follow-up" }}</span>
                                                        @endif
                                                    </span>
                                                    <span>
                                                        {{ $candidate->current_status }}
                                                    </span>
                                                </h2>
                                                <p class="candidate-designation"></span></p>
                                                <ul class="candidate-exp">
                                                    <li><svg style="margin: 0 0 3px;" xmlns="http://www.w3.org/2000/svg" width="15" height="15" viewBox="0 0 24 24">
                                                            <path fill="currentColor" d="M19 4h-2V3a1 1 0 0 0-2 0v1H9V3a1 1 0 0 0-2 0v1H5a3 3 0 0 0-3 3v12a3 3 0 0 0 3 3h14a3 3 0 0 0 3-3V7a3 3 0 0 0-3-3m1 15a1 1 0 0 1-1 1H5a1 1 0 0 1-1-1v-7h16Zm0-9H4V7a1 1 0 0 1 1-1h2v1a1 1 0 0 0 2 0V6h6v1a1 1 0 0 0 2 0V6h2a1 1 0 0 1 1 1Z" />
                                                        </svg>
                                                        @if($candidate->total_experience_years <= 0 && $candidate->total_experience_months <= 0)
                                                                {{ 'Fresher' }}
                                                                @else
                                                                {{ "Experienced | ".$candidate->total_experience_years }} year(s) and
                                                                {{ $candidate->total_experience_months }} month(s)
                                                                @endif
                                                                </li>
                                                </ul>
                                                <ul class="candidate-other-details">
                                                    <li><span><img src="https://res.cloudinary.com/dvzfuapyy/image/upload/v1732987464/Vector_5_tcssnw.png" alt=""></span> {{ $candidate->addressline1 }}, {{ $candidate->addressline2 }}, {{ $candidate->city }}, {{ $candidate->state }}, {{ $candidate->pincode }}, {{ $candidate->country }}</li>
                                                    <li><span><img src="https://res.cloudinary.com/dvzfuapyy/image/upload/v1732987486/Group_1000003496_q0e7bb.png" alt=""></span> {{ $candidate->contactno }}</li>
                                                    <li><span><img src="https://res.cloudinary.com/dvzfuapyy/image/upload/v1732987464/MailOutline_j1jddb.png" alt=""></span> {{ $candidate->email }}</li>
                                                    <li></li>
                                                    <li>
                                                    </li>
                                                </ul>
                                                <span class="craeted_by" >Created By : {{ $candidate->created_by }}  | Created At : {{ \Carbon\Carbon::parse($candidate->created_at)->format('[ d-m-y , h:i A ]') }}</span>
                                                <span class="candidate-date">Last Updated : {{ date('d-M-Y', strtotime($candidate->updated_at)) }}</span>
                                            </div>
                                            {{-- <div class="candidate-trigger-btn">
                                                <a href=""><span><img src="https://res.cloudinary.com/dvzfuapyy/image/upload/v1732987925/Vector_7_ohflk6.png" alt=""></span> View CV</a>
                                                <a href=""><span><img src="https://res.cloudinary.com/dvzfuapyy/image/upload/v1732987925/DownloadOutline_dvwmyt.png" alt=""></span> Download CV</a>
                                            </div> --}}
                                            <div class="candidate-trigger-btn">
                                                <!-- View CV -->
                                                <a href="{{ route('candidate.viewCV', $candidate->candidateid) }}" target="_blank">
                                                    <span>
                                                        <img src="https://res.cloudinary.com/dvzfuapyy/image/upload/v1732987925/Vector_7_ohflk6.png" alt="">
                                                    </span>
                                                    View CV
                                                </a>
                                            
                                                <!-- Download CV -->
                                                <a href="{{ route('candidate.downloadCV', $candidate->candidateid) }}">
                                                    <span>
                                                        <img src="https://res.cloudinary.com/dvzfuapyy/image/upload/v1732987925/DownloadOutline_dvwmyt.png" alt="">
                                                    </span>
                                                    Download CV
                                                </a>
                                            </div>
                                            
                                        </div>
                                        @endforeach
                                    </div>
                                 </div>

                                 <div class="row">
                                    <div id="candidate-count">
                                        Total Candidates: {{ count($candidates) }}
                                    </div>
                                
                                    <div class="filter">
                                        <label for="status-filter">Filter by Status:</label>
                                        <select id="status-filter" onchange="filterCandidates2()">
                                            <option value="">Select Status</option>
                                            <option value="Follow-Up">Follow-Up</option>
                                            <option value="Shortlisted">Shortlisted</option>
                                            <option value="Interview In Process">Interview In Process</option>
                                            <option value="Cancelled Interviews">Cancelled Interviews</option>
                                            <option value="Completed Interviews">Completed Interviews</option>
                                            <option value="Decision Pending">Decision Pending</option>
                                            <option value="Offered">Offered</option>
                                        </select>
                                    </div>
                                
                                    <div class="filter">
                                        <label for="date-filter">Filter by Date:</label>
                                        <select id="date-filter" onchange="handleDateFilterChange()">
                                            <option value="">Select Date Range</option>
                                            <option value="Today">Today</option>
                                            <option value="This Week">This Week</option>
                                            <option value="This Month">This Month</option>
                                            <option value="Last Month">Last Month</option>
                                            <option value="Overall">Overall</option>
                                            <option value="Custom">Custom</option>
                                        </select>
                                
                                        <!-- Custom Date Range -->
                                        <div id="custom-date-range" style="display: none;">
                                            <input type="date" id="from-date">
                                            <input type="date" id="to-date">
                                            <button onclick="filterCandidates2()">Apply</button>
                                        </div>
                                    </div>
                                
                                    <!-- Candidate List -->
                                    <div id="candidate-list">
                                        @foreach($candidates as $candidate)
                                            <div>{{ $candidate->firstname ." ". $candidate->current_status . " $candidate->current_status_update_timestamp "}}</div>
                                        @endforeach
                                    </div>
                                </div>
                                
                                <script>
                                const candidates = @json($candidates);
                                const statuses = {
                                    'Follow-Up': ['Follow-up'],
                                    'Shortlisted': ['Shortlisted'],
                                    'Interview In Process': [
                                        'Hr Round Scheduled', 'Written Assessment Scheduled', 'Technical Round Scheduled', 'Final Round Scheduled',
                                        'HR Round Re-scheduled', 'Written Assessment Re-scheduled', 'Technical Round Re-scheduled', 'Final Round Re-scheduled',
                                        'Hr Round Hold', 'Written Assessment Hold', 'Technical Round Hold', 'Final Round Hold'
                                    ],
                                    'Cancelled Interviews': [
                                        'Hr Round Cancelled', 'Written Assessment Cancelled', 'Technical Round Cancelled', 'Final Round Cancelled'
                                    ],
                                    'Completed Interviews': [
                                        'Hr Round-Selected', 'Written Assessment-Selected', 'Technical Round-Selected', 'Final Round-Selected',
                                        'Hr Round-Rejected', 'Written Assessment-Rejected', 'Technical Round-Rejected', 'Final Round-Rejected'
                                    ],
                                    'Decision Pending': [
                                        'Hr Round-Conducted-On-Hold', 'Written Assessment-Conducted-On-Hold', 'Technical Round-Conducted-On-Hold', 'Final Round-Conducted-On-Hold'
                                    ],
                                    'Offered': ['Offered'],
                                };
                                
                                // Show/Hide Custom Date Fields
                                // function toggleCustomDateFilter() {
                                //     const selectedDateRange = document.getElementById('date-filter').value;
                                //     document.getElementById('custom-date-range').style.display = (selectedDateRange === 'Custom') ? 'block' : 'none';
                                // }

                                function handleDateFilterChange() {
                                    const selectedDateRange = document.getElementById('date-filter').value;
                                    
                                    // Show custom date fields only when "Custom" is selected
                                    if (selectedDateRange === 'Custom') {
                                        document.getElementById('custom-date-range').style.display = 'block';
                                    } else {
                                        document.getElementById('custom-date-range').style.display = 'none';
                                        filterCandidates2(); // Immediately apply the filter
                                    }
                                }
                                
                                // Get Date Range Based on Selection
                                function getDateRange(range) {
                                    const today = new Date();
                                    let startDate, endDate;
                                
                                    switch (range) {
                                        case 'Today':
                                            startDate = endDate = new Date();
                                            break;
                                        case 'This Week':
                                            startDate = new Date(today.setDate(today.getDate() - today.getDay()));
                                            endDate = new Date(today.setDate(today.getDate() - today.getDay() + 6));
                                            break;
                                        case 'This Month':
                                            startDate = new Date(today.getFullYear(), today.getMonth(), 1);
                                            endDate = new Date(today.getFullYear(), today.getMonth() + 1, 0);
                                            break;
                                        case 'Last Month':
                                            startDate = new Date(today.getFullYear(), today.getMonth() - 1, 1);
                                            endDate = new Date(today.getFullYear(), today.getMonth(), 0);
                                            break;
                                        default: // Overall
                                            startDate = endDate = null;
                                    }
                                
                                    return { startDate, endDate };
                                }
                                
                                // Filter Candidates
                                function filterCandidates2() {
                                    const selectedStatus = document.getElementById('status-filter').value;
                                    const selectedDateRange = document.getElementById('date-filter').value;
                                
                                    let { startDate, endDate } = getDateRange(selectedDateRange);
                                
                                    // If "Custom" is selected, get custom dates
                                    if (selectedDateRange === 'Custom') {
                                        const fromDate = document.getElementById('from-date').value;
                                        const toDate = document.getElementById('to-date').value;
                                
                                        startDate = fromDate ? new Date(fromDate) : null;
                                        endDate = toDate ? new Date(toDate) : null;
                                    }
                                
                                    // Filter Candidates Based on Status and Date
                                    const filteredCandidates = candidates.filter(candidate => {
                                        const statusMatch = selectedStatus ? statuses[selectedStatus].includes(candidate.current_status) : true;
                                        const candidateDate = new Date(candidate.current_status_update_timestamp);
                                        const dateMatch = (!startDate || !endDate) || (candidateDate >= startDate && candidateDate <= endDate);
                                
                                        return statusMatch && dateMatch;
                                    });
                                
                                    // Update Candidate List
                                    const candidateListDiv = document.getElementById('candidate-list');
                                    candidateListDiv.innerHTML = '';
                                
                                    if (filteredCandidates.length === 0) {
                                        candidateListDiv.innerHTML = '<div>No candidates found for the selected filters.</div>';
                                    } else {
                                        filteredCandidates.forEach(candidate => {
                                            const candidateDiv = document.createElement('div');
                                            candidateDiv.textContent = `${candidate.firstname} - ${candidate.current_status} - ${candidate.current_status_update_timestamp}`;
                                            candidateListDiv.appendChild(candidateDiv);
                                        });
                                    }
                                
                                    // Update Total Candidate Count
                                    document.getElementById('candidate-count').textContent = `Total Candidates: ${filteredCandidates.length}`;
                                }
                                
                                // Initial Load
                                filterCandidates2();
                                </script>
                                
                                
                             </div>
                        </div>
                    </div><!-- container fluid -->

                </div> <!-- Page content Wrapper -->

            </div> <!-- content -->

            @include('component.pagefooter')

        </div>
        <!-- End Right content here -->

    </div>
    <!-- END wrapper -->


    @include('foot.footer')
    <!-- <script src="{{ asset('public/assets/js/custome-date-filter.js') }}"></script> -->\

    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const searchInput = document.getElementById('candidateSearch');
            const candidateList = document.getElementById('candidateList');
            const profileCount = document.getElementById('profileCount');
            const candidateStatus = document.getElementById('candidateStatus');
            const dateFilter = document.getElementById("dateFilter");
            const candidateItems = document.querySelectorAll('.candidate-item');
            const fromDateInput = document.getElementById('fromDate');
            const toDateInput = document.getElementById('toDate');
            const searchDateButton = document.getElementById('searchDateButton');
         

            // Function to format date as 'YYYY-MM-DD' for comparison
            function formatDate(dateStr) {
                const date = new Date(dateStr);
                return date.toISOString().split('T')[0];
            }

            // Function to filter candidates
            function filterCandidates() {
                const searchText = searchInput.value.toLowerCase();
                const c_status = candidateStatus.value.toLowerCase();
                const selectedDateFilter = dateFilter.value;
                console.log(selectedDateFilter)
                const fromDate = fromDateInput.value;
                const toDate = toDateInput.value;
    
                let visibleCount = 0;

                candidateItems.forEach(function(candidate) {
                    const name = candidate.getAttribute('data-name').toLowerCase();
                    const email = candidate.getAttribute('data-email').toLowerCase();
                    const location = candidate.getAttribute('data-location').toLowerCase();
                    const status = candidate.getAttribute('data-status').toLowerCase();
                    const contact = candidate.getAttribute('data-contact').toLocaleLowerCase();
                    const c_date = candidate.getAttribute('data-date');
                    console.log(c_date)
                    const formattedDate = formatDate(c_date);
                    let dateMatch = true;

                    // Date filtering logic
                    const today = new Date().toISOString().split('T')[0];
                    console.log(today)
                    const startOfWeek = new Date();
                    startOfWeek.setDate(startOfWeek.getDate() - startOfWeek.getDay());

                    const startOfMonth = new Date();
                    startOfMonth.setDate(1);

                    if (selectedDateFilter === "today" && formattedDate !== today) {
                        dateMatch = false;
                    } else if (selectedDateFilter === "This Week" && (new Date(formattedDate) < startOfWeek)) {
                        dateMatch = false;
                    } else if (selectedDateFilter === "This Month" && (new Date(formattedDate) < startOfMonth)) {
                        dateMatch = false;
                    } else if (selectedDateFilter === "Custom") {
                        if (fromDate && toDate) {
                            const formattedFromDate = formatDate(fromDate);
                            const formattedToDate = formatDate(toDate);

                            if (new Date(formattedDate) < new Date(formattedFromDate) || new Date(formattedDate) > new Date(formattedToDate)) {
                                dateMatch = false;
                            }
                        } else {
                            dateMatch = false;
                        }
                    }

                    if (
                        (name.includes(searchText) || email.includes(searchText) || location.includes(searchText) || status.includes(searchText) || c_date.includes(searchText) || contact.includes(searchText)) && (c_status === "all" || status === c_status) &&
                        dateMatch 
                    ) {
                        candidate.style.display = 'flex';
                        visibleCount++;
                    } else {
                        candidate.style.display = 'none';
                    }
                });

                // Update profile count
                profileCount.textContent = visibleCount;
            }

            // Event listeners
            searchInput.addEventListener('input', filterCandidates);
            candidateStatus.addEventListener('change', filterCandidates);
            dateFilter.addEventListener('change', filterCandidates);
            searchDateButton.addEventListener('click', filterCandidates);
            // Initial filter to show all profiles
            filterCandidates();
        });



        document.getElementById('dateFilter').addEventListener('change', function() {
            const selectedFilter = this.value;
            const customDateBox = document.getElementById('customDate');
            // Show/hide custom date range input
            if (selectedFilter === 'Custom') {
                customDateBox.style.display = 'block';
            } else {
                customDateBox.style.display = 'none';
            }

        });
        document.addEventListener('click', function(event) {
            const customDateBox = document.getElementById('customDate');
            const dateFilterElement = document.getElementById('dateFilter');
            if (!customDateBox.contains(event.target) && event.target !== dateFilterElement) {
                customDateBox.style.display = 'none';
            }
        });

        document.addEventListener('DOMContentLoaded', function() {
            const candidateFilterLi = document.querySelectorAll(".candidate-filter-list li");

            candidateFilterLi.forEach(candidateLi => {
                const dropdown = candidateLi.querySelector('.list-filtering');

                // Toggle dropdown visibility on click
                candidateLi.addEventListener('click', function(event) {
                    event.stopPropagation();
                    closeAllDropdowns();
                    dropdown.classList.toggle('open');
                });
            });

            document.addEventListener('click', function() {
                closeAllDropdowns();
            });

            // Function to close all dropdowns
            function closeAllDropdowns() {
                const allDropdowns = document.querySelectorAll('.list-filtering.open');
                allDropdowns.forEach(dropdown => dropdown.classList.remove('open'));
            }
        });
    </script>
</body>

</html>
@else
@php
return redirect('/')->send();
@endphp
@endif

