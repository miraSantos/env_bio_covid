from dateutil import relativedelta

# Calculate dates
d = date.today()
six_m = d - relativedelta.relativedelta(months=6)
one_y = d - relativedelta.relativedelta(years=1)

# Set earliest_date & latest_date in builds
if "ny_6m" in config["builds"]:
    config["builds"]["ny_6m"]["latest_date"] = d.strftime('%Y-%m-%d')
    config["builds"]["ny_6m"]["earliest_date"]= six_m.strftime('%Y-%m-%d')

# Add # of sequences per subsampling group
for build in config["builds"]:
    if "n_sequences" in config["builds"][build]:
        n = config["builds"][build]["n_sequences"]
        config["builds"][build]['n_usa'] = int(n*2/5)
        config["builds"][build]['n_global'] = int(n/5)
        config["builds"][build]['n_early'] = int(n/4)
        config["builds"][build]['n_global_early'] = int(n*3/20)
