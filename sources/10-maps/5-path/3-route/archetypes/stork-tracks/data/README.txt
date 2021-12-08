README

This data file is published by the Movebank Data Repository (www.datarepository.movebank.org). As of the time of publication, a version of this published animal tracking dataset can be viewed on Movebank (www.movebank.org) in the study "Eastern flyway spring migration of adult white storks (data from Rotics et al. 2018)" (Movebank Study ID 560041066). Individual attributes in the data files are defined below and in the Movebank Attribute Dictionary, available at www.movebank.org/node/2381.

This data package includes the following data files:
Eastern flyway spring migration of adult white storks (data from Rotics et al. 2018)-acc.csv
Eastern flyway spring migration of adult white storks (data from Rotics et al. 2018)-gps.csv
Eastern flyway spring migration of adult white storks (data from Rotics et al. 2018)-reference-data.csv
JAE_meta_data.csv

These data are described in the following written publication:
Rotics S, Kaatz M, Turjeman S, Zurell D, Wikelski M, Sapir N, Eggers U, Fiedler W, Jeltsch F, Nathan R (2018) Early arrival at breeding grounds: causes, costs and a trade-off with overwintering latitude. Journal of Animal Ecology. doi:10.1111/1365-2656.12898

Data package citation:
Rotics S, Kaatz M, Turjeman S, Zurell D, Wikelski M, Sapir N, Eggers U, Fiedler W, Jeltsch F, Nathan R (2018) Data from: Early arrival at breeding grounds: causes, costs and a trade-off with overwintering latitude. Movebank Data Repository. doi:10.5441/001/1.v8d24552

-----------

Terms of Use
This data file is licensed by the Creative Commons Zero (CC0 1.0) license. The intent of this license is to facilitate the re-use of works. The Creative Commons Zero license is a "no rights reserved" license that allows copyright holders to opt out of copyright protections automatically extended by copyright and other laws, thus placing works in the public domain with as little legal restriction as possible. However, works published with this license must still be appropriately cited following professional and ethical standards for academic citation.

We highly recommend that you contact the data creator if possible if you will be re-using or re-analyzing data in this file. Researchers will likely be interested in learning about new uses of their data, might also have important insights about how to properly analyze and interpret their data, and/or might have additional data they would be willing to contribute to your project. Feel free to contact us at support@movebank.org if you need assistance contacting data owners.

See here for the full description of this license
http://creativecommons.org/publicdomain/zero/1.0

-----------

Data Attributes
These definitions come from the Movebank Attribute Dictionary, available at www.movebank.org/node/2381.

animal comments: Additional information about the animal that is not described by other reference data terms.
	example: sibling of #1423

animal death comments: Comments about the death of the animal.
	example: hit by a car

animal ID: An individual identifier for the animal, provided by the data owner. This identifier can be a ring number, a name, the same as the associated tag ID, etc. If the data owner does not provide an Animal ID, an internal Movebank animal identifier may sometimes be shown.
	example: 91876A, Gary
	same as: individual-local-identifier

animal life stage: The age class or life stage of the animal at the beginning of the deployment. Can be years or months of age or terms such as "adult", "subadult" and "juvenile". Units should be defined in the values (e.g. "2 years").
	example: juvenile, adult
	units: Any units should be defined in the remarks.

attachment type: The way a tag is attached to an animal. Values are chosen from a controlled list:
	collar: The tag is attached by a collar around the animal's neck.
	glue: The tag is attached to the animal using glue.
	harness: The tag is attached to the animal using a harness.
	implant: The tag is placed under the skin of the an animal.
	tape: The tag is attached to the animal using tape.
	other: user specified

beacon frequency: The frequency of the radio tag or tag retrieval beacon.
	example: 450.5
	units: MHz
	same as: tag beacon frequency

deploy off timestamp: The timestamp when the tag deployment ended.
	example: 2009-10-01 12:00:00.000
	format: yyyy-MM-dd HH:mm:ss.sss
	units: UTC (Coordinated Universal Time) or GPS time, which is a few leap seconds different from UTC
	same as: deploy off date

deploy on person: The name of the person/people who attached the tag to the animal and began the deployment.
	example: G. Smith

deploy on timestamp: The timestamp when the tag deployment started.
	example: 2008-08-30 18:00:00.000
	format: yyyy-MM-dd HH:mm:ss.sss
	units: UTC (Coordinated Universal Time) or GPS time, which is a few leap seconds different from UTC
	same as: deploy on date

deployment comments: Additional information about the tag deployment that is not described by other reference data terms.
	example: This deployment was excluded from analysis because the tag failed.

deployment end comments: a description of the end of a tag deployment, such as cause of mortality or notes on the removal and/or failure of tag.
	example: Data transmission stopped after 108 days. Cause unknown.

deployment ID: A unique identifier for the deployment of a tag on animal, provided by the data owner. If the data owner does not provide a Deployment ID, an internal Movebank deployment identifier may sometimes be shown.
	example: Jane-Tag42

duty cycle: Remarks associated with the duty cycle of a tag during the deployment, describing the times it is on/off and the frequency at which it transmits or records data.
	example: it turns off during the night
	units: Any units should be defined in the remarks.

e-obs acceleration axes: This tells you about the enabled ACC axes, like X and/or Y and/or Z (definition from "e-obs GPS-acceleration-tags application note: How to use the acceleration sensor, interpret, analyse its data and how to get values in m/s^2", 2011).
	example: XYZ
	units: none

e-obs acceleration sampling frequency per axis: This is the sampling frequency for one axis. Don't mix this up with the sampling frequency for all axes together. For example if you have three ACC axes enabled, then the sampling frequency for all axes together is three times the sampling frequency for one axis. The sampling frequency is measured in Hertz, which is the same as 1/second. For example a sampling frequency of 10 Hz means that you get 10 samples per second (definition from "e-obs GPS-acceleration-tags application note: How to use the acceleration sensor, interpret, analyse its data and how to get values in m/s^2", 2011).
	example: 5.93
	units: hertz (Hz)

e-obs accelerations raw: Acceleration along the X and or Y and or Z axes of the tag, depending on which axes were activated on the tag as described in the field e-obs acceleration axes. Measurements alternate one measurement for each active axis in alphabetical order. The values are digital readings between 0 and 4095 of the analogue digital converter on the tag, and can be converted to m/s^2 with proper calibration. These samples are made at the rate described by the field e-obs acceleration sampling frequency per axis starting with the first sample at the time described in the field e-obs start timestamp. Tags with numbers e-obs numbers 2242 and higher, which began being provided in spring 2012, have Y-axis values in the opposite direction from those in older tags (definition from "e-obs GPS-acceleration-tags application note: How to use the acceleration sensor, interpret, analyse its data and how to get values in m/s^2", 2011; Wolgang Heidrich, e-obs Digital Telemetry, personal communication, 2012).
	example: 1844 1889 1653 1845 1896 1653 1837 1897 1653 1842 1898 1650 1844 1899 1644 1840…
	units: none (values must be calibrated and converted)

e-obs status: The record status, from e-obs GPS/accelerometer tags (definition from e-obs Digital Telemetry Manual for DataDecoder Software, 2010). Allowed values are
A = position and time within accuracy masks
B = only time of week and weeknumber valid
C = only weeknumber valid
D = no valid data
	example: D
	units: none

e-obs type of fix: The type of fix of data from e-obs GPS/accelerometer tags (definition from e-obs Digital Telemetry Manual for DataDecoder Software, 2010). Allowed values are
3 = 3D fix
2 = 2D fix
	example: 3
	units: none

event comments: Additional information about individual records or events in a data set that is not described by other reference data terms.
	example: we observed the animal foraging (see photo BT25)
	same as: comments
THIS DATASET: overall dynamic body acceleration (ODBA)

event ID: An identifier for the set of information associated with each record or event in a data set. A unique event ID is assigned to every time-location or other time-measurement record in Movebank.
	example: 6340565
	units: none

ground speed: The estimated ground speed between consecutive locations.
	example: 7.22
	units: meters per second

heading: The direction in which the tag moved from this location to the subsequent location, calculated as the bearing between consecutive locations, in decimal degrees clockwise from north; for example, 0 = north, 90 = east, 180 = south.
	example: 315.88
	units: decimal degrees

height above ellipsoid: The estimated height above the ellipsoid returned by the GPS unit. (If altitudes are calculated as height above mean sea level, use height above mean sea level.)
	example: 24.8
	units: meters

latitude (decimal degree): The geographic longitude of a location along an animal track as estimated by the processed sensor data. Positive values are east of the Greenwich Meridian, negative values are west of it.
	example: -121.1761111
	units: decimal degrees, WGS84 reference system
	same as: location lat

longitude (decimal degree): The geographic longitude of a location along an animal track as estimated by the processed sensor data. Positive values are east of the Greenwich Meridian, negative values are west of it.
	example: -121.1761111
	units: decimal degrees, WGS84 reference system
	same as: location long

manipulation type: The way in which the animal was manipulated during the deployment. Additional details about the manipulation can be provided using manipulation comments. Values are chosen from a controlled list:
	confined: The animal's movement was restricted to within a defined area.
	none: The animal received no treatment other than the tag attachment.
	relocated: The animal was released from a site other than the one at which it was captured.
	manipulated other: The animal was manipulated in some other way, such as a physiological manipulation.

ring ID: A number or color scheme for a band or ring attached to the animal.
example: 26225
	units: none
	same as: animal ring id

sensor type: The type of sensor with which data were collected. Values are chosen from a controlled list:
	acceleration: The sensor collects acceleration data.
	accessory measurements: The sensor collects accessory measurements, such as battery voltage.
	Argos Doppler shift: The sensor is using Argos Doppler shift for determining position.
	barometer: The sensor records air or water pressure.
	bird ring: The animal is identified by a ring that has a unique ID.
	GPS: The sensor uses GPS to find location and stores these.
	magnetometer: The sensor records the magnetic field.
	natural mark: The animal is identified by a natural marking.
	radio transmitter: The sensor is a classical radio transmitter.
	solar geolocator: The sensor collects light levels, which are used to determine position (for processed locations).
	solar geolocator raw: The sensor collects light levels, which are used to determine position (for raw light-level measurements).

sex: The sex of the biological individual(s) represented in the Occurrence. Values are from a controlled list:
	m: male
	f: female

start timestamp: The date and time when the sampling interval or burst began.
	example: 2011-01-03 13:45:00.000
	format: yyyy-MM-dd HH:mm:ss.sss
	units: UTC (Coordinated Universal Time) or GPS time, which is a few leap seconds different from UTC

study: The name of the study in Movebank in which data are stored.

study site: The name of the deployment site, for example a field station or colony.
	example: Pickerel Island North

study-specific measurement: Values for a study-specific attribute.
	example: 1112:01
	units: undefined
THIS DATASET: Index to match between compatible records in the ACC and GPS tables.

tag comments: Additional information about the tag that is not described by other reference data terms.
	example: custom-made Doppler shift Argos tag with a special altitude sensor

tag ID: A unique identifier for the tag, provided by the data owner. If the data owner does not provide a tag ID, an internal Movebank tag identifier may sometimes be shown.
	example: 2342, ptt_4532
	same as: tag local identifier

tag manufacturer name: The company or person that produced the tag.
	example: Holohil
	same as: manufacturer

tag mass: The mass of the tag.
	example: 24
	units: grams

tag model: The model of the tag.
	example: T61
	same as: model

tag readout method: The way the data are received from the tag. Values are chosen from a controlled list:
	satellite: Data are transferred via satellite.
	phone network: Data are transferred via a phone network, such as GSM or AMPS.
	other wireless: Data are transferred via another form of wireless data transfer, such as a VHF radio transmitter/receiver.
	tag retrieval: The tag must be physically retrieved in order to obtain the data.

taxon: The scientific name of the species on which the tag was deployed, as defined by the Integrated Taxonomic Information System (ITIS, www.itis.gov). If the species name can not be provided, this should be the lowest level taxonomic rank that can be determined and that is used in the ITIS taxonomy. Additional information can be provided using the term taxon detail.
	example: Buteo swainsoni
	same as: species, animal taxon, individual taxon canonical name

timestamp: The date and time a sensor measurement was taken.
	example: 2008-08-14 18:31:00.000
	format: yyyy-MM-dd HH:mm:ss.sss
	units: UTC (Coordinated Universal Time) or GPS time, which is a few leap seconds different from UTC

visible: Determines whether an event is visible on the Movebank Search map. Values are calculated automatically, with FALSE indicating that the event has been marked as an outlier by manually marked outlier or algorithm marked outlier. Allowed values are TRUE or FALSE.

-----------

File JAE_meta_data.csv

This file contains a summary of breeding attempt and fledglings by year for each bird in the dataset. This information is also integrated into the reference data file.
id: identifier for the bird (same as deployment-id in the GPS and ACC data)
Year: year
Sex: sex of the bird
Fledglings: number of fledglings
Breeding attempt: whether or not the bird made a breeding attempt (1 = yes, 0 = no)
comment: comments

-----------

More Information
For more information about this repository, see www.movebank.org/node/15294, the FAQ at www.movebank.org/node/2220, or contact us at support@movebank.org.