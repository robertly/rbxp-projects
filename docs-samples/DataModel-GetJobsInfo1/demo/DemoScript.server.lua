local jobInfo = game:GetJobsInfo()
local jobTitles = jobInfo[1]

table.remove(jobInfo, 1)

local divider = string.rep("-", 120)
print(divider)
warn("JOB INFO:")
print(divider)

for _, job in pairs(jobInfo) do
	for jobIndex, jobValue in pairs(job) do
		local jobTitle = jobTitles[jobIndex]
		warn(jobTitle, "=", jobValue)
	end
	print(divider)
end
