
# For a given ad, what is the email address of the user that created it?
SELECT u.email
FROM users AS u
WHERE u.id IN (
    SELECT ua.userID
    FROM users_ads AS ua
    JOIN ads AS a ON ua.adID = a.id
    WHERE a.id = 3
    );

# For a given ad, what category, or categories, does it belong to?
SELECT c.description
FROM categories AS c
WHERE c.id IN (
    SELECT ac.categoryID
    FROM ads_categories AS ac
    WHERE ac.adID = 4
    );

# For a given category, show all the ads that are in that category.
SELECT a.description
FROM ads AS a
WHERE a.id IN (
    SELECT adID
    FROM ads_categories ac
    WHERE categoryID = 2
    );

# For a given user, show all the ads they have posted.
SELECT description
FROM ads
WHERE id IN (
    SELECT adID
    FROM users_ads AS ua
    JOIN users AS u ON ua.userID = u.id
    WHERE u.email = 'jon@example.com'
    );