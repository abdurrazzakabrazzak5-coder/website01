# Rupkotha Dream: go live (free)

## 1. Supabase (database + photo storage, free)
1. supabase.com > New project (free plan). Wait until it is ready.
2. SQL Editor > paste everything from `setup.sql` > Run.
3. Authentication > Users > Add user > your email + password (this is your dashboard login).
   Also turn OFF "Allow new users to sign up" (Authentication > Sign In / Providers) so nobody else can register.
4. Project Settings > API: copy the Project URL and the anon public key into `config.js`. Put your WhatsApp number there too.

## 2. GitHub
Create a repo, upload all files in this folder (or: git init, git add ., git commit -m "first", git remote add origin <url>, git push -u origin main).

## 3. Vercel
vercel.com > Add New > Project > import the GitHub repo > Framework: Other > Deploy. No build command needed.
Every push to GitHub redeploys automatically.

## Use it
- Website: your-project.vercel.app
- Dashboard: your-project.vercel.app/admin (sign in, add a saree with photos, price, sizes, description). It appears on the website instantly.

## Lock the admin page with environment variables
Vercel > Project > Settings > Environment Variables, add (for Production, Preview, Development):
- ADMIN_USER = your chosen username
- ADMIN_PASS = a long password
Then Deployments > Redeploy. Visiting /admin now asks for this username and password before the page is even sent.
The page lives in /private and is not publicly downloadable. You still sign in with your Supabase email/password inside the dashboard.
