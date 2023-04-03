%Reading parameters from scenario_impacts_source.xlsx
%Export-weighted average food impact intensities - multiply by imports
f_expavg = readmatrix('scenario_impacts_source.xlsx', 'Sheet', 'f_expavg', 'Range', 'C2:CV26');
%Domestic food impact intensities - multiply by domestic production
%To be converted to multi-dimensional array
f_dom_all = readmatrix('scenario_impacts_source.xlsx', 'Sheet', 'f_dom', 'Range', 'C2:CV2526');
%Baseline supply imports
s1_imp = readmatrix('scenario_impacts_source.xlsx', 'Sheet', 's1_imp', 'Range', 'B2:CU102');
%Baseline supply domestic production
s1_dom = readmatrix('scenario_impacts_source.xlsx', 'Sheet', 's1_dom', 'Range', 'B2:CU102');

%Creating multi-dimensional array for f_dom
%Each page is impacts x food for each country

%Create a page for each country n
f_dom=zeros(25,98,101);
for n = 1:101
    f_dom(:,:,n) = f_dom_all(25*n-24:25*n,:);
end

%Create baseline supply
s1_kg = s1_imp + s1_dom;
%Create assumed imports and domestic production share for each country
share_imp = s1_imp./(s1_kg);
share_dom = s1_dom./(s1_kg);
%Use only average impact intensities for plant-based subs and
%insects
share_imp(:,96:98)=1;
%Remove NaN
share_imp(isnan(share_imp))=0;
share_dom(isnan(share_dom))=0;
%%%%%%%%%%%%%%%%%%%%%%

%SCENARIO 1 - BASELINE
%Create impact results multi-dimensional page
%Each page is impact of each food for each country
impact_p1 = zeros(25,98,101);
for n = 1:101
    %loop through each food
    f_p = zeros(25,98);
    for f = 1:98
        %loop through each impact category
        imp_p = zeros(25,1);
        for c = 1:25
            imp = 10^6*f_dom(c,f,n)*share_dom(n,f)*s1_kg(n,f) + f_expavg(c,f)*share_imp(n,f)*s1_kg(n,f)*10^6;
            imp_p(c,1) = imp;
        end
        f_p(:,f)=imp_p;
    end
    impact_p1(:,:,n)=f_p;
end
%Re-shape 3D array into 2D
impact1=zeros(2525,98);
for n=1:101
    impact1(25*n-24:25*n,:)=impact_p1(:,:,n);
end
%Write results in Excel
filename = 'scenario_impacts.xlsx';
writematrix(impact1,filename,'Sheet','S1','Range','C2');

%%%%%%%%%%%%%%%%%%%%%%

%SCENARIO 2 - EAT-Lancet reference diet
%Scenario supply quantities
s2_kg = readmatrix('scenario_impacts_source.xlsx', 'Sheet', 's2_kg', 'Range', 'B2:CU102');

%Create impact results multi-dimensional page
%Each page is impact of each food for each country
impact_p2 = zeros(25,98,101);
for n = 1:101
    %loop through each food
    f_p = zeros(25,98);
    for f = 1:98
        %loop through each impact category
        imp_p = zeros(25,1);
        for c = 1:25
            imp = 10^6*f_dom(c,f,n)*share_dom(n,f)*s2_kg(n,f) + f_expavg(c,f)*share_imp(n,f)*s2_kg(n,f)*10^6;
            imp_p(c,1) = imp;
        end
        f_p(:,f)=imp_p;
    end
    impact_p2(:,:,n)=f_p;
end
%Re-shape 3D array into 2D
impact2=zeros(2525,98);
for n=1:101
    impact2(25*n-24:25*n,:)=impact_p2(:,:,n);
end
%Write results in Excel
filename = 'scenario_impacts.xlsx';
writematrix(impact2,filename,'Sheet','S2','Range','C2');

%%%%%%%%%%%%%%%%%%%%%%

%SCENARIO 3 - No red meat
%Scenario quantities
s3_kg = readmatrix('scenario_impacts_source.xlsx', 'Sheet', 's3_kg', 'Range', 'B2:CU102');

%Create impact results multi-dimensional page
%Each page is impact of each food for each country
impact_p3 = zeros(25,98,101);
for n = 1:101
    %loop through each food
    f_p = zeros(25,98);
    for f = 1:98
        %loop through each impact category
        imp_p = zeros(25,1);
        for c = 1:25
            imp = 10^6*f_dom(c,f,n)*share_dom(n,f)*s3_kg(n,f) + f_expavg(c,f)*share_imp(n,f)*s3_kg(n,f)*10^6;
            imp_p(c,1) = imp;
        end
        f_p(:,f)=imp_p;
    end
    impact_p3(:,:,n)=f_p;
end
%Re-shape 3D array into 2D
impact3=zeros(2525,98);
for n=1:101
    impact3(25*n-24:25*n,:)=impact_p3(:,:,n);
end
%Write results in Excel
filename = 'scenario_impacts.xlsx';
writematrix(impact3,filename,'Sheet','S3','Range','C2');

%%%%%%%%%%%%%%%%%%%%%%

%SCENARIO 4 - Pescatarian dietary changes
%Scenario quantities
s4_kg = readmatrix('scenario_impacts_source.xlsx', 'Sheet', 's4_kg', 'Range', 'B2:CU102');

%Create impact results multi-dimensional page
%Each page is impact of each food for each country
impact_p4 = zeros(25,98,101);
for n = 1:101
    %loop through each food
    f_p = zeros(25,98);
    for f = 1:98
        %loop through each impact category
        imp_p = zeros(25,1);
        for c = 1:25
            imp = 10^6*f_dom(c,f,n)*share_dom(n,f)*s4_kg(n,f) + f_expavg(c,f)*share_imp(n,f)*s4_kg(n,f)*10^6;
            imp_p(c,1) = imp;
        end
        f_p(:,f)=imp_p;
    end
    impact_p4(:,:,n)=f_p;
end
%Re-shape 3D array into 2D
impact4=zeros(2525,98);
for n=1:101
    impact4(25*n-24:25*n,:)=impact_p4(:,:,n);
end
%Write results in Excel
filename = 'scenario_impacts.xlsx';
writematrix(impact4,filename,'Sheet','S4','Range','C2');

%%%%%%%%%%%%%%%%%%%%%%

%SCENARIO 5 - Vegetarian (whole food subs only) dietary changes
%Scenario quantities
s5_kg = readmatrix('scenario_impacts_source.xlsx', 'Sheet', 's5_kg', 'Range', 'B2:CU102');

%Create impact results multi-dimensional page
%Each page is impact of each food for each country
impact_p5 = zeros(25,98,101);
for n = 1:101
    %loop through each food
    f_p = zeros(25,98);
    for f = 1:98
        %loop through each impact category
        imp_p = zeros(25,1);
        for c = 1:25
            imp = 10^6*f_dom(c,f,n)*share_dom(n,f)*s5_kg(n,f) + f_expavg(c,f)*share_imp(n,f)*s5_kg(n,f)*10^6;
            imp_p(c,1) = imp;
        end
        f_p(:,f)=imp_p;
    end
    impact_p5(:,:,n)=f_p;
end
%Re-shape 3D array into 2D
impact5=zeros(2525,98);
for n=1:101
    impact5(25*n-24:25*n,:)=impact_p5(:,:,n);
end
%Write results in Excel
filename = 'scenario_impacts.xlsx';
writematrix(impact5,filename,'Sheet','S5','Range','C2');

%%%%%%%%%%%%%%%%%%%%%%

%SCENARIO 6 - Vegetarian (whole food and processed food subs) dietary changes
%Scenario quantities
s6_kg = readmatrix('scenario_impacts_source.xlsx', 'Sheet', 's6_kg', 'Range', 'B2:CU102');

%Create impact results multi-dimensional page
%Each page is impact of each food for each country
impact_p6 = zeros(25,98,101);
for n = 1:101
    %loop through each food
    f_p = zeros(25,98);
    for f = 1:98
        %loop through each impact category
        imp_p = zeros(25,1);
        for c = 1:25
            imp = 10^6*f_dom(c,f,n)*share_dom(n,f)*s6_kg(n,f) + f_expavg(c,f)*share_imp(n,f)*s6_kg(n,f)*10^6;
            imp_p(c,1) = imp;
        end
        f_p(:,f)=imp_p;
    end
    impact_p6(:,:,n)=f_p;
end
%Re-shape 3D array into 2D
impact6=zeros(2525,98);
for n=1:101
    impact6(25*n-24:25*n,:)=impact_p6(:,:,n);
end
%Write results in Excel
filename = 'scenario_impacts.xlsx';
writematrix(impact6,filename,'Sheet','S6','Range','C2');

%%%%%%%%%%%%%%%%%%%%%%

%SCENARIO 7 - Vegan (whole food subs only) dietary changes
%Scenario quantities
s7_kg = readmatrix('scenario_impacts_source.xlsx', 'Sheet', 's7_kg', 'Range', 'B2:CU102');

%Create impact results multi-dimensional page
%Each page is impact of each food for each country
impact_p7 = zeros(25,98,101);
for n = 1:101
    %loop through each food
    f_p = zeros(25,98);
    for f = 1:98
        %loop through each impact category
        imp_p = zeros(25,1);
        for c = 1:25
            imp = 10^6*f_dom(c,f,n)*share_dom(n,f)*s7_kg(n,f) + f_expavg(c,f)*share_imp(n,f)*s7_kg(n,f)*10^6;
            imp_p(c,1) = imp;
        end
        f_p(:,f)=imp_p;
    end
    impact_p7(:,:,n)=f_p;
end
%Re-shape 3D array into 2D
impact7=zeros(2525,98);
for n=1:101
    impact7(25*n-24:25*n,:)=impact_p7(:,:,n);
end
%Write results in Excel
filename = 'scenario_impacts.xlsx';
writematrix(impact7,filename,'Sheet','S7','Range','C2');

%%%%%%%%%%%%%%%%%%%%%%

%SCENARIO 8 - Vegan (whole food and processed food subs) dietary changes
%Scenario quantities
s8_kg = readmatrix('scenario_impacts_source.xlsx', 'Sheet', 's8_kg', 'Range', 'B2:CU102');

%Create impact results multi-dimensional page
%Each page is impact of each food for each country
impact_p8 = zeros(25,98,101);
for n = 1:101
    %loop through each food
    f_p = zeros(25,98);
    for f = 1:98
        %loop through each impact category
        imp_p = zeros(25,1);
        for c = 1:25
            imp = 10^6*f_dom(c,f,n)*share_dom(n,f)*s8_kg(n,f) + f_expavg(c,f)*share_imp(n,f)*s8_kg(n,f)*10^6;
            imp_p(c,1) = imp;
        end
        f_p(:,f)=imp_p;
    end
    impact_p8(:,:,n)=f_p;
end
%Re-shape 3D array into 2D
impact8=zeros(2525,98);
for n=1:101
    impact8(25*n-24:25*n,:)=impact_p8(:,:,n);
end
%Write results in Excel
filename = 'scenario_impacts.xlsx';
writematrix(impact8,filename,'Sheet','S8','Range','C2');

%%%%%%%%%%%%%%%%%%%%%%

%SCENARIO 9 - No red meat -insects
%Scenario quantities
s9_kg = readmatrix('scenario_impacts_source.xlsx', 'Sheet', 's9_kg', 'Range', 'B2:CU102');

%Create impact results multi-dimensional page
%Each page is impact of each food for each country
impact_p9 = zeros(25,98,101);
for n = 1:101
    %loop through each food
    f_p = zeros(25,98);
    for f = 1:98
        %loop through each impact category
        imp_p = zeros(25,1);
        for c = 1:25
            imp = 10^6*f_dom(c,f,n)*share_dom(n,f)*s9_kg(n,f) + f_expavg(c,f)*share_imp(n,f)*s9_kg(n,f)*10^6;
            imp_p(c,1) = imp;
        end
        f_p(:,f)=imp_p;
    end
    impact_p9(:,:,n)=f_p;
end
%Re-shape 3D array into 2D
impact9=zeros(2525,98);
for n=1:101
    impact9(25*n-24:25*n,:)=impact_p9(:,:,n);
end
%Write results in Excel
filename = 'scenario_impacts.xlsx';
writematrix(impact9,filename,'Sheet','S9','Range','C2');

%%%%%%%%%%%%%%%%%%%%%%

%SCENARIO 10 - No red meat and poultry -insects
%Scenario quantities
s10_kg = readmatrix('scenario_impacts_source.xlsx', 'Sheet', 's10_kg', 'Range', 'B2:CU102');

%Create impact results multi-dimensional page
%Each page is impact of each food for each country
impact_p10 = zeros(25,98,101);
for n = 1:101
    %loop through each food
    f_p = zeros(25,98);
    for f = 1:98
        %loop through each impact category
        imp_p = zeros(25,1);
        for c = 1:25
            imp = 10^6*f_dom(c,f,n)*share_dom(n,f)*s10_kg(n,f) + f_expavg(c,f)*share_imp(n,f)*s10_kg(n,f)*10^6;
            imp_p(c,1) = imp;
        end
        f_p(:,f)=imp_p;
    end
    impact_p10(:,:,n)=f_p;
end
%Re-shape 3D array into 2D
impact10=zeros(2525,98);
for n=1:101
    impact10(25*n-24:25*n,:)=impact_p10(:,:,n);
end
%Write results in Excel
filename = 'scenario_impacts.xlsx';
writematrix(impact10,filename,'Sheet','S10','Range','C2');

%%%%%%%%%%%%%%%%%%%%%%

%BASELINE SCENARIO - separating externalities from imported and
%domestically produced food

%IMPORTED FOOD IMPACTS
%Create impact results multi-dimensional page
%Each page is impact of each food for each country
impact_p1_import = zeros(25,98,101);
for n = 1:101
    %loop through each food
    f_p = zeros(25,98);
    for f = 1:98
        %loop through each impact category
        imp_p = zeros(25,1);
        for c = 1:25
            imp = f_expavg(c,f)*share_imp(n,f)*s1_kg(n,f)*10^6;
            imp_p(c,1) = imp;
        end
        f_p(:,f)=imp_p;
    end
    impact_p1_import(:,:,n)=f_p;
end
%Re-shape 3D array into 2D
impact1_import=zeros(2525,98);
for n=1:101
    impact1_import(25*n-24:25*n,:)=impact_p1_import(:,:,n);
end
%Write results in Excel
filename = 'scenario_impacts.xlsx';
writematrix(impact1_import,filename,'Sheet','S1_imported','Range','C2');

%DOMESTICALLY PRODUCED FOOD IMPACTS
%Create impact results multi-dimensional page
%Each page is impact of each food for each country
impact_p1_domestic = zeros(25,98,101);
for n = 1:101
    %loop through each food
    f_p = zeros(25,98);
    for f = 1:98
        %loop through each impact category
        imp_p = zeros(25,1);
        for c = 1:25
            imp = 10^6*f_dom(c,f,n)*share_dom(n,f)*s1_kg(n,f);
            imp_p(c,1) = imp;
        end
        f_p(:,f)=imp_p;
    end
    impact_p1_domestic(:,:,n)=f_p;
end
%Re-shape 3D array into 2D
impact1_domestic=zeros(2525,98);
for n=1:101
    impact1_domestic(25*n-24:25*n,:)=impact_p1_domestic(:,:,n);
end
%Write results in Excel
filename = 'scenario_impacts.xlsx';
writematrix(impact1_domestic,filename,'Sheet','S1_domestic','Range','C2');