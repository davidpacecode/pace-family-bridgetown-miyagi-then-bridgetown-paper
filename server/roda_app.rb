# Roda is a simple Rack-based framework with a flexible architecture based
# on the concept of a routing tree. Bridgetown uses it for its development
# server, but you can also run it in production for fast, dynamic applications.
#
# Learn more at: https://www.bridgetownrb.com/docs/routes

class RodaApp < Roda
  plugin :bridgetown_server

  # Some Roda configuration is handled in the `config/initializers.rb` file.
  # But you can also add additional Roda configuration here if needed.

  route do |r|
    # ---- Login ----
    r.on 'login' do
      r.get do
        <<~HTML
          <!DOCTYPE html>
          <html>
          <head>
            <meta charset="utf-8">
            <meta name="viewport" content="width=device-width, initial-scale=1">
            <title>The Pace Family</title>
            <style>
              body {
                font-family: system-ui, -apple-system, sans-serif;
                display: flex; align-items: center; justify-content: center;
                min-height: 100vh; margin: 0; background: #f5f5f5;
              }
              .login-box {
                background: white; padding: 2rem; border-radius: 8px;
                box-shadow: 0 2px 8px rgba(0,0,0,0.1);
                width: 100%; max-width: 320px;
              }
              h1 { margin-top: 0; font-size: 1.4rem; }
              input[type="password"] {
                width: 100%; padding: 0.5rem; border: 1px solid #ccc;
                border-radius: 4px; font-size: 1rem; box-sizing: border-box;
              }
              button {
                margin-top: 1rem; width: 100%; padding: 0.6rem;
                background: #2563eb; color: white; border: none;
                border-radius: 4px; font-size: 1rem; cursor: pointer;
              }
              button:hover { background: #1d4ed8; }
              .error { color: #dc2626; font-size: 0.85rem; margin-bottom: 1rem; }
            </style>
          </head>
          <body>
            <div class="login-box">
              <h1>The Pace Family</h1>
              #{"<p class='error'>Nope, try again.</p>" if r.params['failed']}
              <form method="post" action="/login">
                <label for="password">Password</label>
                <input type="password" name="password" id="password" autofocus>
                <button type="submit">Enter</button>
              </form>
            </div>
          </body>
          </html>
        HTML
      end

      r.post do
        password = r.params['password'].to_s.strip

        case password
        when ENV['HOME_PASSWORD']
          session['auth'] = 'home'
          r.redirect session.delete('return_to') || '/home/'
        when ENV['FAMILY_PASSWORD']
          session['auth'] = 'family'
          r.redirect session.delete('return_to') || '/family/'
        else
          sleep 0.5
          r.redirect '/login?failed=1'
        end
      end
    end

    # ---- Logout ----
    r.on 'logout' do
      session.clear
      r.redirect '/'
    end

    # ---- Protect /home/ ----
    if r.path_info.start_with?('/home') && !(session['auth'] == 'home')
      session['return_to'] = r.path_info
      r.redirect '/login'
    end

    # ---- Protect /family/ ----
    if r.path_info.start_with?('/family') && !%w[family home].include?(session['auth'])
      session['return_to'] = r.path_info
      r.redirect '/login'
    end

    # All routes (including protected ones after auth passes) handled by Bridgetown
    r.bridgetown
  end
end
