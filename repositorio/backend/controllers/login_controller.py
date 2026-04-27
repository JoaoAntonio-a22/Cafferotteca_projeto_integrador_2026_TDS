from flask import Flask, render_template, request, redirect, url_for

def login():
    if request.method == 'POST':
        username = request.form['username']

        if username:
            return redirect(url_for('menu', username=username))
        else:
            return redirect(url_for('menu'))
    
    return render_template('login.html')