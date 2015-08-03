from datetime import datetime, timedelta
now = datetime.now()
while True:
	print now.strftime("%A %d %B, %Y")
	now = now + timedelta(1)
