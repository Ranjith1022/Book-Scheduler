<?php
/**
Copyright 2011-2020 Nick Korbel

This file is part of Booked Scheduler.

Booked Scheduler is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

Booked Scheduler is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with Booked Scheduler.  If not, see <http://www.gnu.org/licenses/>.
*/

error_reporting(E_ALL & ~E_NOTICE & ~E_STRICT);
//ini_set('display_errors', 1);
//ini_set('display_startup_errors', 1);

/**
 * Application configuration
 */
$conf['settings']['app.title'] = 'Booked Scheduler';                    // application title
$conf['settings']['default.timezone'] = 'Asia/Kolkata';      // look up here http://php.net/manual/en/timezones.php
$conf['settings']['allow.self.registration'] = 'true';          // if users can register themselves
$conf['settings']['admin.email'] = 'admin@example.com';         // email address of admin user
$conf['settings']['admin.email.name'] = 'Booked Administrator'; // name to be used in From: field when sending automatic emails
$conf['settings']['default.page.size'] = '50';                  // number of records per page
$conf['settings']['enable.email'] = 'true';                     // global configuration to enable if any emails will be sent
$conf['settings']['default.language'] = 'en_us';                // find your language in the lang directory
$conf['settings']['script.url'] = 'http://localhost/Web';       // public URL to the Web directory of this instance. this is the URL that appears when you are logging in. leave http: or https: off to auto-detect
$conf['settings']['image.upload.directory'] = 'Web/uploads/images'; // full or relative path to where images will be stored
$conf['settings']['image.upload.url'] = 'uploads/images';       // full or relative path to show uploaded images from
$conf['settings']['cache.templates'] = 'true';                  // true recommended, caching template files helps web pages render faster
$conf['settings']['use.local.js.libs'] = 'false';                // false recommended, delivers jQuery from Google CDN, uses less bandwidth
$conf['settings']['registration.captcha.enabled'] = 'true';     // recommended. unless using recaptcha this requires php_gd2 enabled in php.ini
$conf['settings']['registration.require.email.activation'] = 'false';           // requires enable.email = true
$conf['settings']['registration.auto.subscribe.email'] = 'false';                       // requires enable.email = true
$conf['settings']['registration.notify.admin'] = 'false';               // whether the registration of a new user sends an email to the admin (ala phpScheduleIt 1.2)
$conf['settings']['inactivity.timeout'] = '30';                         // minutes before the user is automatically logged out
$conf['settings']['name.format'] = '{first} {last}';                    // display format when showing user names
$conf['settings']['css.extension.file'] = '';                           // full or relative url to an additional css file to include. this can be used to override the default style
$conf['settings']['disable.password.reset'] = 'false';          // if the password reset functionality should be disabled
$conf['settings']['home.url'] = '';                                             // the url to open when the logo is clicked
$conf['settings']['logout.url'] = '';                                           // the url to be directed to after logging out
$conf['settings']['default.homepage'] = '1';                            // the default homepage to use when new users register (1 = Dashboard, 2 = Schedule, 3 = My Calendar, 4 = Resource Calendar)

$conf['settings']['schedule']['use.per.user.colors'] = 'false';                 // color reservations by user
$conf['settings']['schedule']['show.inaccessible.resources'] = 'true';  // whether or not resources that are inaccessible to the user are visible
$conf['settings']['schedule']['reservation.label'] = '{name}';                  // format for what to display on the reservation slot label.  Available properties are: {name}, {title}, {description}, {email}, {phone}, {organization}, {position}, {startdate}, {enddate} {resourcename} {participants} {invitees} {reservationAttributes}. Custom attributes can be added using att with the attribute id. For example {att1}
$conf['settings']['schedule']['hide.blocked.periods'] = 'false';        // if blocked periods should be hidden or shown
$conf['settings']['schedule']['update.highlight.minutes'] = '0';    // if set, will show reservations as 'updated' for a certain amount of time
$conf['settings']['schedule']['show.week.numbers'] = 'false';
/**
 * ical integration configuration
 */
