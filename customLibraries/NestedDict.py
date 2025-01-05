resp = {'Results': [{'Country': 'UNITED STATES (USA)', 'Mfr_CommonName': 'Tesla', 'Mfr_ID': 955, 'Mfr_Name': 'TESLA, INC.'}]}

nested_dict = {'key':[1,2,3,5,6,7,8,9]}

print(resp['Results'][0]['Country'])

print(nested_dict['key'][2])


greeting = 'Good Morning'

if greeting == 'Good Morning':
    print("PASS")
else:
    print("FAIL")

